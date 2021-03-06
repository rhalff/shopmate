part of controls;

class StepperPainter extends CustomPainter {
  Paint _paint;
  Paint _paint2;
  Paint _linePaint;
  final double radius;
  final Color color;
  final Color inactiveColor;
  final double strokeWidth;
  final TextAlign alignment;
  final StepperState stepState;

  StepperPainter({
    this.radius,
    this.strokeWidth,
    this.color,
    this.inactiveColor = const Color(0xFFEEEEEE),
    this.alignment,
    this.stepState,
  }) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    _paint2 = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    _linePaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final position = _getCirclePosition(size);

    _drawLine(canvas, size);
    canvas.drawCircle(position, radius + 4, _paint2);
    _paint.color =
        stepState == StepperState.uncompleted ? inactiveColor : color;
    canvas.drawCircle(position, radius, _paint);
  }

  void _drawLine(Canvas canvas, Size size) {
    if (stepState == StepperState.completed ||
        (stepState == StepperState.current && alignment == TextAlign.right)) {
      _linePaint.color = color;
    } else if (stepState == StepperState.uncompleted ||
        (stepState == StepperState.current && alignment == TextAlign.left)) {
      _linePaint.color = inactiveColor;
    } else if (alignment == TextAlign.right) {
      _linePaint.color = color;
    } else {
      _linePaint.color = inactiveColor;
    }

    canvas.drawLine(
      Offset.zero,
      Offset(size.width, 0.0),
      _linePaint,
    );

    if (stepState == StepperState.current && alignment == TextAlign.center) {
      _linePaint.color = color;
      canvas.drawLine(
        Offset.zero,
        Offset(size.width / 2, 0.0),
        _linePaint,
      );
    }
  }

  Offset _getCirclePosition(Size size) {
    var x = 0.0;
    if (alignment == TextAlign.center) {
      x = size.width / 2;
    } else if (alignment == TextAlign.right) {
      x = size.width - radius;
    } else if (alignment == TextAlign.left) {
      x = radius;
    }

    return Offset(x, 0.0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
