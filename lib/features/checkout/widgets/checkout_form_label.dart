part of checkout.widgets;

class CheckoutFormLabel extends StatelessWidget {
  final Widget child;
  final String label;
  CheckoutFormLabel({
    this.label,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: theme.textTheme.display3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: child,
          ),
        ],
      ),
    );
  }
}
