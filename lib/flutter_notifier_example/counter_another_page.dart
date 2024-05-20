import 'package:flutter/material.dart';
import 'package:flutter_dersi3/flutter_notifier_example/pubdev_eaxample.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton:
          FloatingActionButton(onPressed: context.read<Counter>().increment),
      body: Center(child: Text(context.watch<Counter>().count.toString())),
    );
  }
}
