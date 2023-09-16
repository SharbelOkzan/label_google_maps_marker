part of 'marker_layout.dart';

class _PinPointMarker extends MarkerLayout {
  static const double _pipPointCurvedSectionHeightRatio = 2.7;

  @override
  ui.Canvas getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required double width,
    required double height,
    required Color color,
  }) {
    final Paint paint = Paint()..color = color;
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(width / 2);
    canvas.clipPath(Path()
      ..moveTo(0, height / _pipPointCurvedSectionHeightRatio)
      ..lineTo(width / 2, height.toDouble())
      ..lineTo(width.toDouble(), height / _pipPointCurvedSectionHeightRatio)
      ..arcToPoint(
        Offset(width.toDouble(), 0),
      )
      ..arcToPoint(const Offset(0, 0)));
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
}
