import 'package:flutter/material.dart';
import 'package:flutter_dersi3/navigation_example/screen1.dart';
import 'package:flutter_dersi3/navigation_example/screen2.dart';
import 'package:flutter_dersi3/navigation_example/screen3.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Screen1(),
                      ));
                },
                child: const Text("Screen1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Screen3(),
                      ));
                },
                child: const Text("Screen2")),
          ],
        ),
      ),
    );
  }
}
