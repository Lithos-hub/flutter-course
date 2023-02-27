import 'package:designs/screens/first_design_screen.dart';
import 'package:designs/screens/second_design_screen.dart';
import 'package:designs/screens/third_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'third_design',
      theme: ThemeData.dark(),
      routes: {
        'first_design': (BuildContext _) => const FirstDesignScreen(),
        'second_design': (BuildContext _) => const SecondDesignScreen(),
        'third_design': (BuildContext _) => const ThirdDesignScreen(),
      },
    );
  }
}
