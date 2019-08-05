part of cart.widgets;

class CartTable extends StatelessWidget {
  final List<CartWithProduct> cart;
  final ValueChanged<int> removeFromCart;
  final ValueChanged<int> onItemDecrease;
  final ValueChanged<int> onItemIncrease;
  CartTable({
    @required this.cart,
    @required this.removeFromCart,
    @required this.onItemIncrease,
    @required this.onItemDecrease,
  }) : assert(cart != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: _buildHeader(),
        ),
        Line(height: 2),
        Expanded(
          child: _buildRows(),
        ),
      ],
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Header3(
            'Item',
            style: TextStyle(
              color: TypographyColors[2],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Header3(
            'Size',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TypographyColors[2],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Header3(
            'Quantity',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TypographyColors[2],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Header3(
            'Price',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: TypographyColors[2],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRows() {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  ...cart.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: CartRow(
                        product: item,
                        onItemDecrease: onItemDecrease,
                        onItemIncrease: onItemIncrease,
                        removeFromCart: removeFromCart,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
