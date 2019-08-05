part of catalog.widgets;

class PriceColumn extends StatelessWidget {
  final Product product;
  PriceColumn({
    @required this.product,
  }) : assert(product != null);
  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.simpleCurrency(name: 'GBP');
    final theme = Theme.of(context);

    if (product.discountedPrice != null && product.discountedPrice > 0) {
      return Column(
        children: <Widget>[
          if (product.discountedPrice != null)
            Text(
              numberFormat.format(product.discountedPrice),
              style: theme.textTheme.display2.copyWith(
                color: theme.accentColor,
              ),
            ),
          Text(
            numberFormat.format(product.price),
            style: theme.textTheme.display3.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      );
    } else {
      return Text(
        numberFormat.format(product.price),
        style: theme.textTheme.display2.copyWith(
          color: theme.accentColor,
        ),
      );
    }
  }
}
