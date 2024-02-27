import 'package:flutter/material.dart';
import 'package:flutter_dersi3/screens/home_screen.dart';
import 'package:flutter_dersi3/stack/stack_example.dart';

void main(List<String> args) {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StackExample(),
    );
  }
}
