import 'package:flutter/widgets.dart';

typedef Paint = void Function(Canvas canvas, Size size, {Color fill});

class Vector extends StatelessWidget {
  final Paint _paint;
  final Color _fill;
  Vector(this._paint, {Color fill}) : _fill = fill;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _VectorPainter(_paint, _fill),
    );
  }
}

class _VectorPainter extends CustomPainter {
  final Paint _paint;
  final Color _fill;
  _VectorPainter(this._paint, this._fill);

  @override
  void paint(Canvas canvas, Size size) {
    this._paint(canvas, size, fill: _fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
