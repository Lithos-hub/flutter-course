import 'package:flutter/material.dart';

class SecondDesignScreen extends StatelessWidget {
  const SecondDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18262C),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF16272E), Color(0xFF18262C)])),
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [Background(), MainContent()]);
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF18262C),
      child: Center(
          child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 13, 20, 24),
            shape: const StadiumBorder(),
            elevation: 10,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 30, vertical: 15)),
        onPressed: () {},
        child: const Text("Welcome",
            style: TextStyle(fontSize: 20, color: Colors.cyan)),
      )),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Saturday, 10',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          const Text(
            '22º',
            style: TextStyle(
                fontSize: 50, color: Color.fromARGB(255, 166, 228, 255)),
          ),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 80)
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF18262C),
      height: double.infinity,
      child: ShaderMask(
        shaderCallback: (bounds) => RadialGradient(
                radius: 0.8,
                colors: [Colors.white, Colors.white.withOpacity(0.1)])
            .createShader(bounds),
        child: const Image(
          image: AssetImage('assets/background-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
