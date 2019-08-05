part of checkout.pages;

class OrderSummary extends StatelessWidget {
  final List<CartWithProduct> cart;
  OrderSummary({
    this.cart,
  }) : assert(cart != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header3('Order summary'),
          SizedBox(height: 15),
          Column(
            children: <Widget>[
              _buildHeader(),
              SizedBox(height: 15),
              ..._buildRows(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Header3(
            'Item',
            style: TextStyle(
              color: Color(0xFFB4B4B4),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Header3(
              'Qty',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFFB4B4B4),
              ),
            ),
          ),
        ),
        Expanded(
          child: Header3(
            'Price',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFB4B4B4),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildRows(context) {
    return mapWithIndex<CartWithProduct, Widget>(cart, (
      CartWithProduct product,
      int index,
    ) {
      return _buildRow(
        name: product.name,
        attributes: product.attributes,
        quantity: product.quantity,
        price: product.price,
        odd: (index % 2) == 1,
        context: context,
      );
    });
  }

  Widget _buildRow({
    String name,
    String attributes,
    int quantity,
    double price,
    bool odd,
    BuildContext context,
  }) {
    final cells = <Widget>[];
    final theme = Theme.of(context);

    cells.addAll([
      Expanded(
        flex: 2,
        child: Text('$name ($attributes)'),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      Expanded(
        child: Price(
          price: price,
          currency: 'GBP',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: theme.textTheme.body1.fontSize),
        ),
      ),
    ]);

    return Container(
        decoration: BoxDecoration(
          color: odd ? Colors.transparent : Color(0xFFF7F7F7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: cells,
          ),
        ));
  }
}
