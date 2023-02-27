import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background({super.key});

  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blueGrey.shade900.withBlue(90),
        Colors.teal.shade900.withOpacity(0.8).withBlue(100)
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          bottom: -20,
          right: -80,
          child: _Shape(),
        )
      ],
    );
  }
}

class _Shape extends StatelessWidget {
  const _Shape({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 5,
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
                  Colors.pink.shade200.withOpacity(0),
                  Colors.pink.shade500
                ]),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
