import 'package:flutter/material.dart';

import 'package:components_portfolio/theme/app_theme.dart';

class CustomCardPrimary extends StatelessWidget {
  const CustomCardPrimary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        elevation: 10,
        child: Column(children: [
          ListTile(
            title: const Text('titulo 1'),
            leading: Icon(Icons.abc, color: AppTheme.primary),
            subtitle: const Text('lorem ipsum dolor'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: const Text('Cancel'),
                ),
                TextButton(onPressed: () => {}, child: const Text('OK')),
              ],
            ),
          )
        ]));
  }
}
