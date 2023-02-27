import 'package:designs/widgets/third_design_background.dart';

import 'package:designs/widgets/third_design_navbar.dart';
import 'package:designs/widgets/third_design_page.dart';

import 'package:flutter/material.dart';

class ThirdDesignScreen extends StatelessWidget {
  const ThirdDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          const PageItem(),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
