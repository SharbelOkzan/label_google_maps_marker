import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_google_maps_marker/src/marker_painting_util.dart';
import 'package:label_google_maps_marker/src/marker_layout.dart/marker_layout.dart';

class LabelMarker extends Marker {
  const LabelMarker({
    required this.hieght,
    required this.width,
    required this.color,
    required this.label,
    required this.layout,
    required super.markerId,
    super.alpha,
    super.anchor,
    super.consumeTapEvents,
    super.draggable,
    super.flat,
    super.infoWindow,
    super.position,
    super.rotation,
    super.visible,
    super.zIndex,
    super.onTap,
    super.onDrag,
    super.onDragStart,
    super.onDragEnd,
  });

  final String label;
  final MarkerLayout layout;
  final double hieght;
  final double width;
  final Color color;

  Future<Marker> toGoogleMapMarker() async {
    BitmapDescriptor labelBitmap = await MapPaintingUtil().paintMarkerWithLabel(
        label: label,
        markerLayout: layout,
        width: hieght,
        height: width,
        color: color);
    return copyWith(iconParam: labelBitmap);
  }
}
