part of cart.widgets;

class CartIconButton extends StatefulWidget {
  @override
  _CartIconButtonState createState() => _CartIconButtonState();
}

class _CartIconButtonState extends State<CartIconButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: _build,
    );
  }

  Widget _build(BuildContext context, CartState cartState) {
    final theme = Theme.of(context);

    const icon = const Icon(Icons.shopping_cart);

    if (!(cartState is CartLoaded)) {
      return icon;
    }

    final state = cartState as CartLoaded;

    return Center(
      child: GestureDetector(
        onTap: _onPressed,
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: icon,
              tooltip: 'Show shopping cart',
              onPressed: _onPressed,
            ),
            if (state.cart.length > 0)
              Positioned(
                right: 0,
                top: 8,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '${state.totalItems}',
                    style: TextStyle(
                      color: theme.accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed(CartScreen.route);
  }
}
