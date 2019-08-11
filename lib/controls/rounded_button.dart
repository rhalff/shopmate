part of controls;

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle style;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  RoundedButton({
    @required this.text,
    this.onPressed,
    this.padding,
    this.style,
    this.backgroundColor,
  }) : assert(text != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RaisedButton(
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: theme.textTheme.display4
              .copyWith(
                color: Colors.white,
              )
              .merge(style),
        ),
      ),
      color: backgroundColor ?? theme.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
