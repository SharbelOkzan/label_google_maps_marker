import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_google_maps_marker/label_google_maps_marker.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  Set<Marker> _markers = {};

  // LabelMarker.toGoogleMapMarker() is async
  // so we can't call it in the build method
  @override
  void initState() {
    Future.wait(_labeledMarkers.map(
        (labelMarker) => labelMarker.toGoogleMapMarker())).then(_setMarkers);
    super.initState();
  }

  _setMarkers(Iterable<Marker> markers) => setState(() {
        _markers = markers.toSet();
      });

  static const List<LatLng> _randomLocations = [
    LatLng(37.42190000000000, -122.085700000000),
    LatLng(37.43996999580664, -122.100749655962),
    LatLng(37.44596133580664, -122.113749655962),
  ];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<LabelMarker> _labeledMarkers = [
    for (int i = 0; i < 3; i++)
      LabelMarker(
          position: _randomLocations[i],
          label: "$i",
          backgroundColor: Colors.purple,
          layout: MarkerLayout.circular(),
          markerId: MarkerId("$i"))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          markers: _markers, // Then pass the markers to GoogleMap like usual
          initialCameraPosition: _kGooglePlex,
        ),
      ),
    );
  }
}
