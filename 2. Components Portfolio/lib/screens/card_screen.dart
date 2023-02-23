import 'package:flutter/material.dart';

import 'package:components_portfolio/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          children: const [
            CustomCardPrimary(),
            SizedBox(height: 10),
            CustomCardSecondary(
              imageDesc: 'Image 1',
              imageUrl:
                  'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
            ),
            SizedBox(height: 10),
            CustomCardSecondary(
                imageUrl:
                    'https://images.unsplash.com/photo-1537824598505-99ee03483384?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            SizedBox(height: 10),
            CustomCardSecondary(
                imageDesc: 'Image 3',
                imageUrl:
                    'https://images.unsplash.com/photo-1484402628941-0bb40fc029e7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            SizedBox(height: 10),
          ],
        ));
  }
}
