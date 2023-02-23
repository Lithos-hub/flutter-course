import 'package:flutter/material.dart';

import 'package:components_portfolio/theme/app_theme.dart';
import 'package:components_portfolio/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Components portfolio',
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        routes: AppRoutes.getAppRoutes(),
        theme: AppTheme.lightTheme);
  }
}
