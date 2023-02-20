import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() => setState(() => counter++);
  void reset() => setState(() => counter = 0);
  void decrement() => setState(() => counter--);

  @override
  Widget build(BuildContext context) {
    const fontSizeLarge = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Número de clicks", style: fontSizeLarge),
            Text('$counter', style: fontSizeLarge),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActions(
        increaseFn: increase,
        decrementFn: decrement,
        resetFn: reset,
      ),
    );
  }
}

class FloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decrementFn;
  final Function resetFn;

  const FloatingActions(
      {super.key,
      required this.increaseFn,
      required this.decrementFn,
      required this.resetFn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () => decrementFn()),
        const SizedBox(width: 20),
        FloatingActionButton(
            child: const Icon(Icons.restart_alt), onPressed: () => resetFn()),
        const SizedBox(width: 20),
        FloatingActionButton(
            child: const Icon(Icons.plus_one), onPressed: () => increaseFn()),
      ],
    );
  }
}
