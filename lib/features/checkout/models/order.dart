part of checkout.models;

class Order {
  final int orderId;
  final int productId;
  final List<ProductAttribute> attributes; // LG, Red
  final String productName;
  final int quantity;
  final double unitCost;
  final double subtotal;

  Order({
    this.orderId,
    this.productId,
    this.attributes,
    this.productName,
    this.quantity,
    this.unitCost,
    this.subtotal,
  });

  @override
  String toString() {
    return '''
Order[
  orderId=$orderId,
  productId=$productId,
  attributes=$attributes,
  productName=$productName,
  quantity=$quantity,
  unitCost=$unitCost,
  subtotal=$subtotal
]
''';
  }
}
