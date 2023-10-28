part of 'marker_layout.dart';

class _CircularMarkerLayout extends MarkerLayout {
  final double radius;

  _CircularMarkerLayout({required this.radius});

  @override
  ui.Canvas getCanvas(ui.PictureRecorder pictureRecorder,
      {required ui.Color color}) {
    return _getCanvas(pictureRecorder, color: color);
  }

  @override
  ui.Offset getLabelOffset(
      {required double width,
      required double height,
      required double textWidth,
      required double textHeight}) {
    return ui.Offset(
        width.half - textWidth.half, height.half - textHeight.half);
  }

  @override
  double get height => radius * 2;

  @override
  double get width => radius * 2;

  ui.Canvas _getCanvas(
    ui.PictureRecorder pictureRecorder, {
    required Color color,
  }) {
    final Canvas canvas = Canvas(pictureRecorder);

    canvas.drawCircle(
      Offset(width.half, height.half),
      radius,
      Paint()..color = color,
    );
    return canvas;
  }
}
