import 'dart:ui' as ui;
import 'package:flutter/material.dart';

part 'pin_point_marker.dart';
part 'circular_marker_layout.dart';
part 'custom_path_marker_layout.dart';

abstract class MarkerLayout {
  ui.Offset getLabelOffset({
    required double width,
    required double height,
    required double textWidth,
    required double textHeight,
  });

  ui.Canvas getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required Color color,
  });

  // TODO consider removing these getters
  double get height;
  double get width;

  const MarkerLayout();
  factory MarkerLayout.pinPoint({double size = 150}) =>
      _PinPointMarker(size: size);
  factory MarkerLayout.circular({double radius = 150}) =>
      _CircularMarkerLayout(radius: radius);

  factory MarkerLayout.customPath({required Path path}) =>
      _CustomPathMarkerLayout(path: path);
}
