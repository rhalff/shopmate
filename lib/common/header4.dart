part of common;

class Header4 extends StatelessWidget {
  final String text;
  final TextStyle style;
  Header4(
    this.text, {
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.display4.merge(style),
    );
  }
}
