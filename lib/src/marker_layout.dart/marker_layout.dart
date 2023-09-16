import 'dart:ui' as ui;
import 'package:flutter/material.dart';

part 'pin_point_marker.dart';

abstract class MarkerLayout {
  ui.Canvas getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required double width,
    required double height,
    required Color color,
  });

  const MarkerLayout();
  factory MarkerLayout.pinPoint() => _PinPointMarker();
  factory MarkerLayout.rectangle() => throw UnimplementedError();
  factory MarkerLayout.circular() => throw UnimplementedError();
}
