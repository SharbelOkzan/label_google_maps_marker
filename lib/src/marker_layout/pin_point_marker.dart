part of 'marker_layout.dart';

class _PinPointMarker extends MarkerLayout {
  static const double _pinPointCurvedSectionHeightRatio = 5;

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
  ui.Offset getLabelOffset({
    required double width,
    required double height,
    required double textWidth,
    required double textHeight,
  }) {
    return ui.Offset(
        width.half - textWidth.half, height.third - textHeight.half);
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
    final Canvas canvas = Canvas(pictureRecorder);

    canvas.clipPath(
      Path()
        ..moveTo(width.half, height)
        ..conicTo(
          0,
          height / _pinPointCurvedSectionHeightRatio.half,
          width.quarter,
          height / _pinPointCurvedSectionHeightRatio,
          2,
        )
        ..cubicTo(
          width.half - width.eighth,
          height.eighth,
          width.half + width.eighth,
          height.eighth,
          width - width.quarter,
          height / _pinPointCurvedSectionHeightRatio,
        )
        ..conicTo(
          width,
          height / _pinPointCurvedSectionHeightRatio.half,
          width.half,
          height,
          2,
        ),
    );
    canvas.drawColor(color, BlendMode.color);
    return canvas;
  }
}

extension _ on num {
  double get half => this / 2;

  double get quarter => this / 4;

  double get third => this / 3;

  double get eighth => this / 8;
}
