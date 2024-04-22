import 'package:flutter/material.dart';
import 'package:flutter_dersi3/http_request_example/my_services.dart';

class HttpExample extends StatefulWidget {
  const HttpExample({super.key});

  @override
  State<HttpExample> createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  MyServices services = MyServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP Requests"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  services.getUserInfo();
                },
                child: const Text("Get Request")),
            ElevatedButton(
                onPressed: () {
                  services.createUser();
                },
                child: const Text("Post Request")),
          ],
        ),
      ),
    );
  }
}
