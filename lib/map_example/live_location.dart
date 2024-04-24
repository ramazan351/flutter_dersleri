import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class LiveLocationTest extends StatefulWidget {
  const LiveLocationTest({super.key});

  @override
  State<LiveLocationTest> createState() => _LiveLocationTestState();
}

class _LiveLocationTestState extends State<LiveLocationTest> {
  late bool
      _navigationMode; // kullancının konumu açık yada kapalı olduğunu kontrol etmek için kullandım
  late int
      _pointerCount; // kullanıcı harita ile ne kadar etkileşime girdiğini gözlemlemek için kullandım
  late AlignOnUpdate _alignPositionOnUpdate;
  late AlignOnUpdate _alignDirectionOnUpdate;
  late final StreamController<double?> _alignPositionStreamController;
  late final StreamController<void> _alignDirectionStreamController;

  @override
  void initState() {
    super.initState();
    _navigationMode = false;
    _pointerCount = 0;
    _alignPositionOnUpdate = AlignOnUpdate.never;
    _alignDirectionOnUpdate = AlignOnUpdate.never;
    _alignPositionStreamController = StreamController<double?>();
    _alignDirectionStreamController = StreamController<void>();
  }

  @override
  void dispose() {
    _alignPositionStreamController.close();
    _alignDirectionStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Location Test'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: const LatLng(0, 0),
          initialZoom: 1,
          minZoom: 0,
          maxZoom: 19,
          onPointerDown: _onPointerDown,
          onPointerUp: _onPointerUp,
          onPointerCancel: _onPointerUp,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName:
                'net.tlserver6y.flutter_map_location_marker.example',
            maxZoom: 19,
          ),
          CurrentLocationLayer(
            focalPoint: const FocalPoint(
              ratio: Point(0.0, 1.0),
              offset: Point(0.0, -60.0),
            ),
            alignPositionStream: _alignPositionStreamController.stream,
            alignDirectionStream: _alignDirectionStreamController.stream,
            alignPositionOnUpdate: _alignPositionOnUpdate,
            alignDirectionOnUpdate: _alignDirectionOnUpdate,
            style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                child: Icon(
                  Icons.navigation,
                  color: Colors.white,
                ),
              ),
              markerSize: Size(40, 40),
              markerDirection: MarkerDirection.heading,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                backgroundColor: _navigationMode ? Colors.blue : Colors.grey,
                foregroundColor: Colors.white,
                onPressed: () {
                  setState(
                    () {
                      _navigationMode = !_navigationMode;
                      _alignPositionOnUpdate = _navigationMode
                          ? AlignOnUpdate.always
                          : AlignOnUpdate.never;
                      _alignDirectionOnUpdate = _navigationMode
                          ? AlignOnUpdate.always
                          : AlignOnUpdate.never;
                    },
                  );
                  if (_navigationMode) {
                    _alignPositionStreamController.add(18);
                    _alignDirectionStreamController.add(null);
                  }
                },
                child: const Icon(
                  Icons.navigation_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPointerDown(e, l) {
    _pointerCount++;
    setState(() {
      _alignPositionOnUpdate = AlignOnUpdate.never;
      _alignDirectionOnUpdate = AlignOnUpdate.never;
    });
  }

  void _onPointerUp(e, l) {
    if (--_pointerCount == 0 && _navigationMode) {
      setState(() {
        _alignPositionOnUpdate = AlignOnUpdate.always;
        _alignDirectionOnUpdate = AlignOnUpdate.always;
      });
      _alignPositionStreamController.add(18);
      _alignDirectionStreamController.add(null);
    }
  }
}
