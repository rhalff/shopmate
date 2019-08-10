part of cart.blocs;

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({
    @required this.cartRepository,
  }) : assert(cartRepository != null);

  @override
  CartState get initialState => CartLoading();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is LoadCart) {
      yield* _loadCart();
    } else if (event is AddToCart) {
      yield* _addToCart(event);
    } else if (event is RemoveFromCart) {
      yield* _removeFromCart(event);
    } else if (event is IncreaseCartItem) {
      yield* _increaseCartItem(event);
    } else if (event is DecreaseCartItem) {
      yield* _decreaseCartItem(event);
    } else if (event is ClearCart) {
      yield* clearCart();
    }
  }

  Stream<CartState> _loadCart() async* {
    try {
      final List<CartWithProduct> cart =
          await this.cartRepository.getShoppingCart();

      yield CartLoaded(cart);
    } catch (error) {
      yield CartError(error);
    }
  }

  Stream<CartState> _addToCart(AddToCart event) async* {
    if (currentState is CartLoaded) {
      yield CartLoading();

      final List<CartWithProduct> updatedCart = await cartRepository.addProduct(
        event.productId,
        event.size,
        event.color,
        event.quantity,
      );

      yield CartLoaded(updatedCart);
    }
  }

  Stream<CartState> _removeFromCart(RemoveFromCart event) async* {
    if (currentState is CartLoaded) {
      final List<CartWithProduct> updatedCart =
          await cartRepository.removeProductItem(event.itemId);

      yield CartLoaded(updatedCart);
    }
  }

  Stream<CartState> _increaseCartItem(IncreaseCartItem event) async* {
    if (currentState is CartLoaded) {
      final List<CartWithProduct> updatedCart =
          await cartRepository.increaseProductItem(event.itemId);

      yield CartLoaded(updatedCart);
    }
  }

  Stream<CartState> _decreaseCartItem(DecreaseCartItem event) async* {
    if (currentState is CartLoaded) {
      final List<CartWithProduct> updatedCart =
          await cartRepository.decreaseProductItem(event.itemId);

      yield CartLoaded(updatedCart);
    }
  }

  Stream<CartState> clearCart() async* {
    if (currentState is CartLoaded) {
      final List<CartWithProduct> updatedCart =
          await cartRepository.emptyCart();
      yield CartLoaded(updatedCart);
    }
  }
}
