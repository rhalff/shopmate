part of checkout.widgets;

class CheckoutPage extends StatelessWidget {
  final String title;
  final List<String> steps;
  final int currentStep;
  final Widget child;
  final List<Widget> footerButtons;
  CheckoutPage({
    @required this.title,
    this.steps = const <String>[],
    this.currentStep = 0,
    this.child,
    this.footerButtons = const [],
  })  : assert(title != null),
        assert(steps != null && steps.length > 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    child.createElement();

    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: isLargeScreen
              ? const EdgeInsets.symmetric(horizontal: 64.0)
              : const EdgeInsets.symmetric(horizontal: 15.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Header(title),
              SizedBox(height: 50),
              Stepper(
                steps: steps,
                currentStep: currentStep,
                strokeWidth: 6,
                radius: 8,
                color: theme.accentColor,
              ),
              Expanded(
                child: ScrollPage(
                  child: child,
                ),
              )
            ],
          ),
        ),
      ),
      persistentFooterButtons: footerButtons,
    );
  }
}
