part of catalog.widgets;

class AddToCartButton extends StatefulWidget {
  final int productId;
  final bool disabled;
  final String size;
  final String color;
  final int quantity;
  AddToCartButton({
    @required this.productId,
    @required this.size,
    @required this.color,
    @required this.quantity,
    this.disabled = false,
  }) : assert(productId != null);
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  CartBloc _cartBloc;
  @override
  void initState() {
    _cartBloc = BlocProvider.of<CartBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: 'Add to cart',
      onPressed: isEnabled ? _dispatch : null,
    );
  }

  void _dispatch() {
    _cartBloc.dispatch(
      AddToCart(
        productId: widget.productId,
        size: widget.size,
        color: widget.color,
        quantity: widget.quantity,
      ),
    );
  }

  get isEnabled {
    return widget.quantity > 0 &&
        widget.size != null &&
        widget.color != null &&
        !widget.disabled;
  }
}
