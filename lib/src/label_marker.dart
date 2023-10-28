import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_google_maps_marker/src/marker_painting_util.dart';
import 'package:label_google_maps_marker/src/marker_layout/marker_layout.dart';

class LabelMarker extends Marker {
  const LabelMarker({
    required this.backgroundColor,
    required this.label,
    required this.layout,
    this.textStyle,
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
  final Color backgroundColor;
  final TextStyle? textStyle;

  Future<Marker> toGoogleMapMarker() async {
    BitmapDescriptor labelBitmap = await MapPaintingUtil().paintMarkerWithLabel(
        label: label,
        markerLayout: layout,
        width: layout.width,
        height: layout.height,
        textStyle: textStyle,
        backgroundColor: backgroundColor);
    return copyWith(iconParam: labelBitmap);
  }
}
