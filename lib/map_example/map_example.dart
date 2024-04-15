import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapExampleScreen extends StatefulWidget {
  const FlutterMapExampleScreen({super.key});

  @override
  State<FlutterMapExampleScreen> createState() =>
      _FlutterMapExampleScreenState();
}

//37.0587715,37.380137
class _FlutterMapExampleScreenState extends State<FlutterMapExampleScreen> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(37.0587715, 37.0587715),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        const MarkerLayer(markers: [
          Marker(
            point: LatLng(37.0587715, 37.0587715),
            child: Icon(
              Icons.center_focus_weak,
              weight: 52,
              size: 52,
            ),
          ),
          Marker(
              point: LatLng(37.0704185, 37.3712808),
              child: Icon(
                Icons.center_focus_weak,
                size: 36,
              ))
        ])
      ],
    );
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Cihazın konum özelliği kapalı");

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // eğer kullanıcı bir kere izin vermezse bu satır çalışır.
        // uygulmayı ikinciaçtığında tekrar  izin vermezse Denied forever çalışır.
        print("İzin bir kereliğine red edildi");

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Konum izni tamamen rededildi.");

      return false;
    }

    print("Konum İzni verildi");
    // konum izni birkereliğine verilse dahi buraya kadar çalışır
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    print("Emulatorun konumu:");
    print(position);
  }
}
