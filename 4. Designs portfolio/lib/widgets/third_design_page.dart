import 'package:designs/widgets/third_design_card_table.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  const PageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Classify transaction',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Classify this transaction into a particular category',
                style: TextStyle(fontSize: 13, color: Colors.blueGrey.shade200),
              ),
              const CardTable()
            ],
          )),
    );
  }
}
