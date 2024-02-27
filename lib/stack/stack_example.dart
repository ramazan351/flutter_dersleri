import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/kedi.jpg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              left: 0,
              top: 0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  "1",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  "2",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  "3",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Text(
                  "4",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),

            Positioned.fill(
              child: UnconstrainedBox(
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Text(
                    "5",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
            )
            // Positioned(
            //   left: MediaQuery.of(context).size.width / 2 - 18,
            //   bottom: MediaQuery.of(context).size.height / 2 - 18,
            //   child: FloatingActionButton(
            //     onPressed: () {},
            //     child: const Text(
            //       "5",
            //       style: TextStyle(fontSize: 36),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
/*
Örnek-1
[
          Container(
            color: Colors.amber,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: const Text(
              "1",
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black,
            child: const Text(
              "2",
              style: TextStyle(fontSize: 36, color: Colors.white),
            ),
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 1 / 3,
            margin: const EdgeInsets.all(24),
            color: Colors.white,
            child: const Text(
              "3",
              style: TextStyle(fontSize: 36, color: Colors.black),
            ),
          )
        ]
*/
