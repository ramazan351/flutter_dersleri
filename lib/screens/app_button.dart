import 'package:flutter/material.dart';

class TextFieldPlace extends StatelessWidget {
  const TextFieldPlace({super.key, required this.onTap, required this.data});
  final Function() onTap;
  final String data;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(data));
  }
}
