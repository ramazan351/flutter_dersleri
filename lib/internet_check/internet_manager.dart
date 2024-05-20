// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';

// class InternetManager {
//   static ValueNotifier<bool> connectionStatus = ValueNotifier(true);
//   static final Connectivity _connectivity = Connectivity();

//   static isThereInternet(ConnectivityResult result) {
//     connectionStatus.value = result != ConnectivityResult.none;
//     print("İnternet =${connectionStatus.value}");
//   }

//   static Future<void> initConnectivity() async {
//     try {
//       connectionStatus.value =
//           (await _connectivity.checkConnectivity()).first !=
//               ConnectivityResult.none;
//       _connectivity.onConnectivityChanged.listen((event) {
//         isThereInternet(event.first);
//         print("İnternet =>  ${connectionStatus.value}");
//       });
//     } on PlatformException catch (e) {
//       print("İnternet =>  ${connectionStatus.value}");
//       print(e);
//       rethrow;
//     }
//   }
// }
