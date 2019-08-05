part of checkout.repositories;

class OrderRepository {
  OrdersApi ordersApi;
  OrderRepository({
    @required this.ordersApi,
  }) : assert(ordersApi != null);

  Future<Order> getOrder(int orderId) async {
    return ordersApi.getOrder(orderId);
  }
}
