part of 'marker_layout.dart';

class _CustomPathMarkerLayout extends MarkerLayout {
  final Path path;

  _CustomPathMarkerLayout({required this.path});
  @override
  Canvas getCanvas(ui.PictureRecorder pictureRecorder, {required Color color}) {
    return _getCanvas(pictureRecorder, path, color: color);
  }

  @override
  Offset getLabelOffset(
      {required double width,
      required double height,
      required double textWidth,
      required double textHeight}) {
    return Offset(width.half - textWidth.half, height.half - textHeight.half);
  }

  @override
  double get height => path.getBounds().height;

  @override
  double get width => path.getBounds().width;

  ui.Canvas _getCanvas(
    ui.PictureRecorder pictureRecorder,
    ui.Path path, {
    required ui.Color color,
  }) {
    final Canvas canvas = Canvas(pictureRecorder);
    ui.Paint paint = ui.Paint()..color = color;
    canvas.drawPath(path, paint);
    return canvas;
  }
}
