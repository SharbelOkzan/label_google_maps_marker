part of 'marker_layout.dart';

class _PinPointMarker extends MarkerLayout {
  static const double _pipPointCurvedSectionHeightRatio = 4;

  final double size;

  _PinPointMarker({required this.size});

  @override
  ui.Canvas getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required Color color,
  }) {
    return _getCanvas(pictureRecorder,
        width: width, height: height, color: color);
  }

  @override
  ui.Offset getOffset({
    required double width,
    required double height,
    required double textWidth,
    required double textHeight,
  }) {
    return ui.Offset(
        (width * 0.5) - textWidth * 0.5, (height * .35) - textHeight * 0.5);
  }

  @override
  double get height => size;

  @override
  double get width => size / 2;

  ui.Canvas _getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required double width,
    required double height,
    required Color color,
  }) {
    final Paint paint = Paint()..color = color;
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(0);
    final Radius radius = Radius.circular(width / 2);
    canvas.clipPath(Path()
      ..moveTo(width / 2, height)
      ..conicTo(0, _pipPointCurvedSectionHeightRatio, width / 2, 0, 2)
      ..conicTo(
          width, _pipPointCurvedSectionHeightRatio, width / 2, height, 2));
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);
    return canvas;
  }
}
