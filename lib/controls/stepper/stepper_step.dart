part of controls;

class StepperStep extends StatelessWidget {
  final double radius;
  final Color color;
  final double strokeWidth;
  final TextAlign alignment;
  final StepperState stepState;
  final String label;
  StepperStep({
    this.radius = 10,
    this.strokeWidth = 10,
    this.color = Colors.red,
    this.alignment = TextAlign.left,
    this.stepState = StepperState.uncompleted,
    this.label,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StepperPainter(
        radius: radius,
        strokeWidth: strokeWidth,
        color: color,
        alignment: alignment,
        stepState: stepState,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36.0),
        child: Header3(
          label,
          textAlign: alignment,
          style: TextStyle(
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }

  Color _getTextColor() {
    return stepState == StepperState.completed ||
            stepState == StepperState.current
        ? color
        : null;
  }
}
