import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_google_maps_marker/src/marker_layout.dart/marker_layout.dart';

class MapPaintingUtil {
  Future<BitmapDescriptor> paintMarkerWithLabel({
    required String label,
    required MarkerLayout markerLayout,
    TextStyle? textStyle,
    required double width,
    required double height,
    required Color color,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = markerLayout.getCanvas(
      pictureRecorder,
      color: color,
    );
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: label,
      style: textStyle,
    );
    painter.layout();

    Offset labelOffset = markerLayout.getOffset(
      width: width,
      height: height,
      textWidth: painter.width,
      textHeight: painter.height,
    );
    painter.paint(
      canvas,
      labelOffset,
    );
    final img = await pictureRecorder
        .endRecording()
        .toImage(width.toInt(), height.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }
}
