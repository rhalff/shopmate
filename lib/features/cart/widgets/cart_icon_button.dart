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

    const icon = Icon(Icons.shopping_cart);

    if (cartState is CartLoading) {
      return Center(
        child: Stack(
          children: <Widget>[
            IconButton(
              icon: icon,
              tooltip: 'Show shopping cart',
              onPressed: _onPressed,
            ),
            Positioned(
              right: 4,
              top: 10,
              child: SizedBox(
                // padding: EdgeInsets.all(2),
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (cartState is CartLoaded) {
      final state = cartState;

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
              if (state.cart.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(
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

    return icon;
  }

  void _onPressed() {
    Navigator.of(context).pushNamed(CartScreen.route, arguments: {
      'transition': PageTransitionType.scale,
      'alignment': Alignment.topRight,
      'duration': const Duration(milliseconds: 400),
    });
  }
}
