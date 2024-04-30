import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dersi3/http_request_example/http_example.dart';
import 'package:flutter_dersi3/http_request_example/product_list.dart';
import 'package:flutter_dersi3/internet_check/internet_manager.dart';
import 'package:flutter_dersi3/map_example/map_example.dart';
import 'package:flutter_dersi3/navigation_example/home_screen.dart';
import 'package:flutter_dersi3/web_view_example/web_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InternetManager.initConnectivity();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: InternetManager.connectionStatus,
        builder: (context, value, widget) {
          return MaterialApp(
            builder: ((context, child) {
              if (value) {
                return child!;
              } else {
                return Container(
                    color: Colors.red,
                    child: const Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "İnternet Bağlantınızı Kontrol Edin",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              }
            }),
            home: const ProductList(),
          );
        });
  }
}
