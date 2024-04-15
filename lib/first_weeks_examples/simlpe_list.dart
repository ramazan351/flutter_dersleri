import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 183, 167, 167),
          primaryColor: Colors.amber,
          appBarTheme: const AppBarTheme(color: Colors.purple)),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int a = 0;
  String textFieldValue = "";
  List<Widget> listeninElemanlari = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  listeninElemanlari.removeLast();
                  setState(() {});
                },
                icon: const Icon(
                  Icons.clean_hands,
                  color: Colors.amber,
                )),
            actions: [
              Container(
                color: Colors.amber,
                child: IconButton(
                    onPressed: () {
                      listeninElemanlari
                          .add(listeninElemani(textEditingController.text));
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              )
            ],
            title: const Text(
              "To Do App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Column(
              children: listeninElemanlari,
            )
          ],
        ),
      ),
    );
  }

  Widget listeninElemani(String value) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            color: Colors.pink,
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.purple, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
