import 'package:flutter/material.dart';
import 'package:flutter_dersi3/flutter_notifier_example/flutter_notifier_example.dart';
import 'package:flutter_dersi3/method_channel_example/method_channel_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MethodChannelExample(),
    );
  }
}
