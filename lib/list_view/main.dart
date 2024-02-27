import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dersi3/list_view/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: MyHomePage(
          title: 'Flutter Demo Home Page', some: MediaQuery.of(context).size),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.some,
  });

  final String title;
  final Size some;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                return await Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: DataList.users.length - 20,
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),//ios physics
                physics: const ClampingScrollPhysics(), //android physics
                // physics: AlwaysScrollableScrollPhysics(), //sürekli kaydırılma özelliğini açık tut
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255)),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        )),
                    child: ListTile(
                      trailing: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                            shape: BoxShape.circle),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.person),
                      ),
                      title: Text(DataList.users[index].username),
                      subtitle: Text("Yaşı: ${DataList.users[index].age}"),
                    ),
                  );
                },
              ),
            ),
          ),
          const Text("Ramazan")
        ],
      ),
    );
  }
}


                    // DataList.users.map((e) => Text(e.age.toString())).toList()

                // <Widget>[
                //   // for (int i = 0; i < DataList.users.length; i++)
                //   //   Text(DataList.users[i].username)

                // ],