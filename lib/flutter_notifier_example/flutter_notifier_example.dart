import 'package:flutter/material.dart';

class FlutterNotifierExample extends StatefulWidget {
  const FlutterNotifierExample({super.key});

  @override
  State<FlutterNotifierExample> createState() => _FlutterNotifierExampleState();
}

class _FlutterNotifierExampleState extends State<FlutterNotifierExample> {
  ValueNotifier<int> counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value += 1;
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text("data: $value");
              },
            )
          ],
        ),
      ),
    );
  }
}
