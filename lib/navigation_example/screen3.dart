import 'package:flutter/material.dart';
import 'package:flutter_dersi3/navigation_example/screen1.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => false,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Text("screen3"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Screen1(),
                      ),
                      (route) => false);
                },
                child: const Text("Screen3")),
          ],
        ),
      ),
    );
  }
}
