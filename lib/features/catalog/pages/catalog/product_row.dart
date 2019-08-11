part of catalog.pages;

class ProductRow extends StatelessWidget {
  final Product product;
  ProductRow({
    @required this.product,
  }) : assert(product != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: documentColors[4],
            onTap: () => _showProductDetail(context, product),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 85,
                  height: 85,
                  child: CachedImage(
                      'https://backendapi.turing.com/images/products/${product.thumbnail}'),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              product.name,
                              style: theme.textTheme.display2,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              product.description,
                              style: theme.textTheme.body1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PriceColumn(product: product),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showProductDetail(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(
      ProductScreen.route,
      arguments: {'product': product},
    );
  }
}
