part of cart.blocs;

@immutable
abstract class CartState extends Equatable {
  CartState([List props = const []]) : super(props);
}

class CartLoading extends CartState {
  @override
  String toString() => 'CartLoading';
}

class CartLoaded extends CartState {
  final List<CartWithProduct> cart;

  CartLoaded(this.cart) : super([cart]);

  int get totalItems {
    return cart.fold(0, (previousValue, element) {
      return previousValue + element.quantity;
    });
  }

  @override
  String toString() {
    return 'CartLoaded[cart: $cart]';
  }
}

class CartError extends CartState {
  final Object error;

  CartError(this.error) : super([error]);

  @override
  String toString() => 'CartError[error: $error]';
}
