part of cart.models;

class Cart {
  final int itemId;
  final String name;
  final String attributes;
  final num productId;
  final double price;
  final int quantity;
  final double subtotal;

  Cart({
    this.itemId,
    this.name,
    this.attributes,
    this.productId,
    this.price,
    this.quantity,
    this.subtotal,
  });

  @override
  String toString() {
    return 'Cart[itemId=$itemId, name=$name, attributes=$attributes, productId=$productId, price=$price, quantity=$quantity, subtotal=$subtotal, ]';
  }
}
