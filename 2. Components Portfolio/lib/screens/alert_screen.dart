import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key, required this.appBar});
  final AppBar appBar;

  void displayAlertIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Cupertino'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Alert content'),
                SizedBox(height: 20),
                FlutterLogo(size: 200)
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child:
                    const Text('Cancel', style: TextStyle(color: Colors.red)),
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Accept')),
            ],
          );
        });
  }

  void displayAlertAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 10,
            title: const Text('Add new user'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Alert content'),
                SizedBox(height: 20),
                FlutterLogo(size: 200)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: ElevatedButton(
            onPressed: () => Platform.isAndroid
                ? displayAlertAndroid(context)
                : displayAlertIOS(context),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Show alert"),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context)),
    );
  }
}
