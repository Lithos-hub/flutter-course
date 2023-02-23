import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  const ListView1Screen({super.key, required this.appBar});
  final listItems = const [
    'Megaman',
    'Metal Gear Solid',
    'Spyro the Dragon',
    'Final Fantasy XIII'
  ];
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: ListView(
          children: listItems
              .map((item) => ListTile(
                    title: Text(item),
                    trailing: const Icon(Icons.chevron_right),
                  ))
              .toList(),
        ));
  }
}
