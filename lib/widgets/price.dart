part of widgets;

class Price extends StatelessWidget {
  final double price;
  final String currency;
  final TextStyle style;
  final TextAlign textAlign;
  Price({
    this.price,
    this.currency = 'GBP',
    this.style,
    this.textAlign,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final numberFormat = NumberFormat.simpleCurrency(name: currency);

    return Text(
      numberFormat.format(price),
      textAlign: textAlign,
      style: theme.textTheme.display2
          .copyWith(
            color: theme.accentColor,
          )
          .merge(style),
    );
  }
}
