part of cart.widgets;

class CartRow extends StatelessWidget {
  final CartWithProduct product;
  final ValueChanged<int> removeFromCart;
  final ValueChanged<int> onItemDecrease;
  final ValueChanged<int> onItemIncrease;
  CartRow({
    @required this.product,
    @required this.removeFromCart,
    @required this.onItemIncrease,
    @required this.onItemDecrease,
  }) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cells = <Widget>[];
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    cells.addAll([
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: isLargeScreen ? 96 : 64,
            width: isLargeScreen ? 96 : 64,
            child: Align(
              alignment: Alignment.topLeft,
              child: CachedImage(
                'https://backendapi.turing.com/images/products/${product.image}',
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Header3(product.name),
              MaterialButton(
                padding: EdgeInsets.zero,
                child: Row(
                  children: <Widget>[
                    Text(
                      'x',
                      style: theme.textTheme.body1.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Text(' '),
                    const Text('Remove'),
                  ],
                ),
                onPressed: () => removeFromCart(product.itemId),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Text(
          product.attributes,
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        flex: 2,
        child: NumericStepper(
          value: product.quantity,
          minValue: 1,
          onDecrease: () => onItemDecrease(product.itemId),
          onIncrease: () => onItemIncrease(product.itemId),
        ),
      ),
      Price(
        price: product.price * product.quantity,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black),
        currency: 'GBP',
        // style: (merge with theme)
      ),
    ]);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: cells,
    );
  }
}
