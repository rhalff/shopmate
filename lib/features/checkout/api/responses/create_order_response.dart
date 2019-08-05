part of checkout.api;

class CreateOrderResponse {
  final String orderId;
  CreateOrderResponse({
    this.orderId,
  });
}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CreateOrderResponseSerializer extends Serializer<CreateOrderResponse>
    with _$CreateOrderResponseSerializer {}
