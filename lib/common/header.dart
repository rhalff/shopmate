part of common;

class Header extends StatelessWidget {
  final String text;
  final TextStyle style;
  Header(
    this.text, {
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.display2.merge(style),
    );
  }
}
