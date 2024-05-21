import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelExample extends StatefulWidget {
  const MethodChannelExample({super.key});

  @override
  State<MethodChannelExample> createState() => _MethodChannelExampleState();
}

class _MethodChannelExampleState extends State<MethodChannelExample> {
  static const platform = MethodChannel('com.ramazan.dev/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _batteryLevel,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
