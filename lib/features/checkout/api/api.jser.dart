// GENERATED CODE - DO NOT MODIFY BY HAND

part of checkout.api;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CreateOrderResponseSerializer
    implements Serializer<CreateOrderResponse> {
  @override
  Map<String, dynamic> toMap(CreateOrderResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'order_id', model.orderId);
    return ret;
  }

  @override
  CreateOrderResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = CreateOrderResponse(
        orderId: map['order_id'] as String ?? getJserDefault('orderId'));
    return obj;
  }
}
