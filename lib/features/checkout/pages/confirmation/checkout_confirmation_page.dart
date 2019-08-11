part of checkout.pages;

class CheckoutConfirmationPage extends StatefulWidget {
  final DeliveryFormData deliveryData;
  CheckoutConfirmationPage({
    @required this.deliveryData,
  }) : assert(deliveryData != null);
  @override
  _CheckoutConfirmationPageState createState() =>
      _CheckoutConfirmationPageState();
}

class _CheckoutConfirmationPageState extends State<CheckoutConfirmationPage> {
  CartBloc _cartBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _buildOrderSummary(),
              ),
              const SizedBox(width: 64),
              Expanded(
                flex: 1,
                child: DeliveryInfo(
                  deliveryData: widget.deliveryData,
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          const Line(height: 2),
          const SizedBox(height: 18),
          BlocBuilder(
            bloc: _cartBloc,
            builder: (
              BuildContext context,
              CartState state,
            ) {
              if (state is CartLoaded) {
                return _buildConfirmationFooter(state.cart);
              }

              return Center(child: const CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }

  Widget _buildConfirmationFooter(List<CartWithProduct> cart) {
    final numberFormat = NumberFormat.simpleCurrency(name: 'GBP');

    final total = cart.fold(0, (num total, CartWithProduct product) {
      return total + product.subtotal;
    });

    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header4(
                      'Subtotal',
                      style: TextStyle(
                        color: const Color(0xFFB4B4B4),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      numberFormat.format(total),
                      style: TextStyle(
                        color: const Color(0xFF2E2E2E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header4(
                      'Shipping',
                      style: TextStyle(
                        color: const Color(0xFFB4B4B4),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'free',
                      style: TextStyle(
                        color: const Color(0xFF2E2E2E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header4(
                      'Grandtotal',
                      style: TextStyle(
                        color: const Color(0xFFB4B4B4),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      numberFormat.format(total),
                      style: TextStyle(
                        color: const Color(0xFF2E2E2E),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return BlocBuilder(
      bloc: _cartBloc,
      builder: (
        BuildContext context,
        CartState state,
      ) {
        if (state is CartLoaded) {
          return OrderSummary(cart: state.cart);
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
