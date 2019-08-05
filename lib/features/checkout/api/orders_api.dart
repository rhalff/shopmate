part of checkout.api;

@GenApiClient(path: '/orders')
class OrdersApi extends ApiClient with _$OrdersApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  OrdersApi({
    this.base,
    this.converters,
  });

  /// Get orders by Customer
  ///
  ///
  @GetReq(
    path: '/inCustomer',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<List<Order>> getOrdersByCustomer();

  /// Get Info about Order
  ///
  ///
  @GetReq(
    path: '/:order_id',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<Order> getOrder(
    @PathParam('order_id') int orderId,
  );

  /// Create a Order
  ///
  ///
  @PostReq(
    path: '/',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<CreateOrderResponse> createOrder(
    @AsFormField() String cartId,
    @AsFormField() int shippingId,
    @AsFormField() int taxId,
  );

  /// Get Info about Order
  ///
  ///
  @GetReq(
    path: '/shortDetail/:order_id',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<OrderStatus> getOrderStatus(
    @PathParam('order_id') int orderId,
  );
}
