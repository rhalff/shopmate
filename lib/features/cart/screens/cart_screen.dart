part of cart.screens;

class CartScreen extends StatefulWidget {
  static const route = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc _cartBloc;

  @override
  void initState() {
    _cartBloc = BlocProvider.of<CartBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (BuildContext context, CartState state) {
        if (state is CartLoaded) {
          return _build(context, state);
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Widget _build(BuildContext context, CartLoaded state) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    iconSize: isLargeScreen ? 48 : 24,
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF2E2E2E),
                    ),
                    tooltip:
                        MaterialLocalizations.of(context).closeButtonTooltip,
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: isLargeScreen
                  ? const EdgeInsets.symmetric(horizontal: 64.0)
                  : const EdgeInsets.symmetric(horizontal: 15.0),
              color: Colors.white,
              child: _buildColumn(state),
            ),
          ),
        ],
      ),
      persistentFooterButtons: _buildFooterButtons(state),
    );
  }

  List<Widget> _buildFooterButtons(CartLoaded state) {
    final theme = Theme.of(context);

    return <Widget>[
      RoundedButton(
        text: 'Back to Shop',
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextStyle(color: theme.accentColor),
        backgroundColor: Colors.white,
      ),
      RoundedButton(
        text: 'Checkout',
        onPressed: state.cart.isNotEmpty
            ? () => Navigator.of(context).pushNamed('/checkout')
            : null,
      ),
    ];
  }

  Widget _buildColumn(CartLoaded state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header('${state.totalItems} Items in your Cart'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: CartTable(
              cart: state.cart,
              onItemDecrease: (int itemId) =>
                  _cartBloc.dispatch(DecreaseCartItem(itemId)),
              onItemIncrease: (int itemId) =>
                  _cartBloc.dispatch(IncreaseCartItem(itemId)),
              removeFromCart: (int itemId) => _cartBloc.dispatch(
                RemoveFromCart(itemId),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
