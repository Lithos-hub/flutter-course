import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey.shade900,
      fixedColor: Colors.cyan,
      unselectedItemColor: Colors.blueGrey.shade400,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
            ),
            label: 'Contacts'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_rounded,
            ),
            label: 'Messages'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.file_download,
            ),
            label: 'Downloads')
      ],
    );
  }
}
