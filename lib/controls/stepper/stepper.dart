part of controls;

class Stepper extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final double strokeWidth;
  final double radius;
  final Color color;
  Stepper({
    this.steps,
    this.currentStep = 0,
    this.strokeWidth = 8,
    this.radius = 8,
    this.color = Colors.red,
  });
  @override
  Widget build(BuildContext context) {
    return _buildSteps();
  }

  Row _buildSteps() {
    final children = <Widget>[];

    for (var index = 0; index < steps.length; index++) {
      final step = steps[index];

      var alignment = TextAlign.center;
      var stepperState = StepperState.Uncompleted;

      if (index < currentStep) {
        stepperState = StepperState.Completed;
      } else if (index == currentStep) {
        stepperState = StepperState.Current;
      }

      if (step == steps.first) {
        alignment = TextAlign.left;
      } else if (step == steps.last) {
        alignment = TextAlign.right;
      }

      children.add(
        Expanded(
          child: StepperStep(
            label: step,
            alignment: alignment,
            stepState: stepperState,
            radius: radius,
            strokeWidth: strokeWidth,
            color: color,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
