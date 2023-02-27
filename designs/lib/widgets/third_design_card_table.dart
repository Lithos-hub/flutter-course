import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.api,
              text: 'Api',
            ),
            _SingleCard(
              color: Colors.red,
              icon: Icons.access_time,
              text: 'Access time',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.amber,
                icon: Icons.accessible,
                text: 'Accesibility'),
            _SingleCard(
              color: Colors.green,
              icon: Icons.add_chart,
              text: 'Charts',
            ),
          ],
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.purple,
              icon: Icons.album,
              text: 'Music',
            ),
            _SingleCard(
              color: Colors.pink,
              icon: Icons.add,
              text: 'Add contacts',
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  const _SingleCard(
      {super.key, required this.color, required this.icon, required this.text});

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue.shade500.withOpacity(0.2),
                  Colors.blueGrey.shade500.withOpacity(0.3)
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: _InnerCardWrapper(color: color, icon: icon, text: text),
          ),
        ),
      ),
    );
  }
}

class _InnerCardWrapper extends StatelessWidget {
  const _InnerCardWrapper({
    required this.color,
    required this.icon,
    required this.text,
  });

  final Color color;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(12, 0, 170, 255),
                color,
              ],
            ),
          ),
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(color: color),
        )
      ],
    );
  }
}
