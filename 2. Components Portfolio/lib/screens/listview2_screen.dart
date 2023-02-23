import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  const ListView2Screen({super.key, required this.appBar});

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
        body: ListView.separated(
            itemBuilder: (_, index) => ListTile(
                  title: Text(listItems[index]),
                  textColor: Colors.indigo,
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.indigo),
                  onTap: () => {},
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: listItems.length));
  }
}
