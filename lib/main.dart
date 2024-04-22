import 'package:flutter/material.dart';
import 'package:flutter_dersi3/http_request_example/http_example.dart';
import 'package:flutter_dersi3/map_example/map_example.dart';
import 'package:flutter_dersi3/navigation_example/home_screen.dart';
import 'package:flutter_dersi3/web_view_example/web_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HttpExample(),
    );
  }
}
