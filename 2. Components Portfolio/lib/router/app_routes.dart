import 'package:flutter/material.dart';

import 'package:components_portfolio/models/models.dart';
import 'package:components_portfolio/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1',
        name: 'List View 1',
        screen: ListView1Screen(appBar: AppBar(title: const Text("List 1"))),
        icon: Icons.list),
    MenuOption(
        route: 'listview2',
        name: 'List View 2',
        screen: ListView2Screen(appBar: AppBar(title: const Text("List 2"))),
        icon: Icons.list_sharp),
    MenuOption(
        route: 'alert',
        name: 'Alerts',
        screen: AlertScreen(appBar: AppBar(title: const Text("My alerts"))),
        icon: Icons.add_alert),
    MenuOption(
        route: 'card',
        name: 'Card',
        screen: CardScreen(appBar: AppBar(title: const Text("My Cards"))),
        icon: Icons.card_giftcard),
    MenuOption(
        route: 'avatar',
        name: 'Circle avatar',
        screen: AvatarScreen(
            appBar: AppBar(
          title: const Text("Avatar"),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: CircleAvatar(
                backgroundColor: Colors.pink.shade900,
                child: const Text('CS'),
              ),
            )
          ],
        )),
        icon: Icons.account_circle),
    MenuOption(
        route: 'animated',
        name: 'Animations',
        screen: const AnimatedScreen(),
        icon: Icons.animation),
    MenuOption(
        route: 'inputs',
        name: 'Inputs',
        screen: InputsScreen(appBar: AppBar(title: const Text("My inputs"))),
        icon: Icons.text_fields_outlined),
    MenuOption(
        route: 'sliders',
        name: 'Sliders',
        screen: SliderScreen(appBar: AppBar(title: const Text("My sliders"))),
        icon: Icons.slideshow),
    MenuOption(
        route: 'listview_builder',
        name: 'Infinite scroll',
        screen: ListViewBuilderScreen(),
        icon: Icons.screen_rotation_alt_sharp),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(
          builder: (context) =>
              HomeScreen(appBar: AppBar(title: const Text("Components list"))));
}
