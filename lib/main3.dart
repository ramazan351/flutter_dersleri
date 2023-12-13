import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber)),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("4. Ders"),
        centerTitle: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //   // mini: true,
      //   isExtended: true,
      //   backgroundColor: Colors.purple,
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.done,
      //     color: Colors.white,
      //   ),
      // ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.pink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /*  Container(
                decoration: BoxDecoration(
                  // color: Colors.cyan,
                  // border: Border(
                  //   top: BorderSide(color: Colors.black, width: 5),
                  //   right: BorderSide(color: Colors.black, width: 5),
                  //   left: BorderSide(color: Colors.black, width: 5),
                  //   bottom: BorderSide(color: Colors.black, width: 5),
                  // ),
                  border: Border.all(color: Colors.black, width: 5),
                  borderRadius: BorderRadius.circular(12),
                  // shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.white, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment(1, 2),
                  ),
                  // boxShadow: const [
                  //   BoxShadow(color: Colors.black45, offset: Offset(1, 5))
                  // ],
                ),
                child: const Text(
                  "Fluttter 4. Ders",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 36),
                ),
              ), */
              Expanded(
                child: Container(
                  color: Colors.teal,
                  child: const Text("data"),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.deepOrange,
                  child: const Text("data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
