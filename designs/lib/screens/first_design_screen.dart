import 'package:flutter/material.dart';

class FirstDesignScreen extends StatelessWidget {
  const FirstDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Image(
            image: AssetImage('assets/background.jpg'),
          ),
          Title(),
          Actions(),
          Information()
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: const [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ActionItem(text: 'CALL', icon: Icon(Icons.phone)),
        SizedBox(width: 50),
        ActionItem(text: 'ROUTE', icon: Icon(Icons.roundabout_right)),
        SizedBox(width: 50),
        ActionItem(text: 'share', icon: Icon(Icons.share)),
      ],
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,
          color: Colors.blue,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade500.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'lorem ipsum dolor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('lorem ipsum dolor subtitle',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber.shade700),
              const SizedBox(
                width: 5,
              ),
              const Text('51')
            ],
          )
        ],
      ),
    );
  }
}
