part of common;

class Header3 extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  Header3(
    this.text, {
    this.textAlign,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: textAlign,
      style: theme.textTheme.display3.merge(style),
    );
  }
}
