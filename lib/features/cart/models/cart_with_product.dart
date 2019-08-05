part of cart.models;

class CartWithProduct {
  final int itemId;
  final String name;
  final String attributes;
  final int productId;
  final double price;
  final int quantity;
  final String image;
  final double subtotal;

  CartWithProduct({
    this.itemId,
    this.name,
    this.attributes,
    this.productId,
    this.price,
    this.quantity,
    this.image,
    this.subtotal,
  });

  @override
  String toString() {
    return 'CartWithProduct[itemId=$itemId, name=$name, attributes=$attributes, productId=$productId, price=$price, quantity=$quantity, image=$image, subtotal=$subtotal, ]';
  }
}
