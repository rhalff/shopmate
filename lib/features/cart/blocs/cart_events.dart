part of cart.blocs;

@immutable
abstract class CartEvent extends Equatable {
  CartEvent([List props = const []]) : super(props);
}

class LoadCart extends CartEvent {
  @override
  String toString() => 'LoadCart';
}

class AddToCart extends CartEvent {
  final int productId;
  final String size;
  final String color;
  final int quantity;

  AddToCart({
    this.productId,
    this.size,
    this.color,
    this.quantity,
  })  : assert(productId != null),
        assert(size != null),
        assert(quantity != null),
        super([productId, size, color, quantity]);

  @override
  String toString() =>
      'AddToCart[productId=$productId,size=$size,color=$color,quantity=$quantity]';
}

class RemoveFromCart extends CartEvent {
  final int itemId;

  RemoveFromCart(this.itemId)
      : assert(itemId != null),
        super([itemId]);

  @override
  String toString() => 'RemoveFromCart[itemId: $itemId]';
}

class IncreaseCartItem extends CartEvent {
  final int itemId;

  IncreaseCartItem(this.itemId)
      : assert(itemId != null),
        super([itemId]);

  @override
  String toString() => 'IncreaseCartItem[itemId: $itemId]';
}

class DecreaseCartItem extends CartEvent {
  final int itemId;

  DecreaseCartItem(this.itemId)
      : assert(itemId != null),
        super([itemId]);

  @override
  String toString() => 'DecreaseCartItem[itemId: $itemId]';
}

class ClearCart extends CartEvent {
  @override
  String toString() => 'ClearCart';
}
