part of checkout.models;

class OrderStatus {
  final int orderId;
  final int totalAmount;
  final String createdOn;
  final String shippedOn;
  final String paid;
  final String name;

  OrderStatus({
    this.orderId,
    this.totalAmount,
    this.createdOn,
    this.shippedOn,
    this.paid,
    this.name,
  });

  @override
  String toString() {
    return '''
OrderStatus[
  orderId=$orderId,
  totalAmount=$totalAmount,
  createdOn=$createdOn,
  shippedOn=$shippedOn,
  paid=$paid,
  name=$name,
]
''';
  }
}
