import 'package:components_portfolio/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:components_portfolio/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.appBar});
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        appBar: appBar,
        body: ListView.separated(
            itemBuilder: (context, i) => ListTile(
                  title: Text(menuOptions[i].name),
                  leading: Icon(menuOptions[i].icon, color: AppTheme.secondary),
                  onTap: () =>
                      Navigator.pushNamed(context, menuOptions[i].route),
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOptions.length));
  }
}
