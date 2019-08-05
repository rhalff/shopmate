part of checkout.models;

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class OrderSerializer extends Serializer<Order> with _$OrderSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class OrderStatusSerializer extends Serializer<OrderStatus>
    with _$OrderStatusSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ShippingRegionSerializer extends Serializer<ShippingRegion>
    with _$ShippingRegionSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ShippingRegionDetailSerializer extends Serializer<ShippingRegionDetail>
    with _$ShippingRegionDetailSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class TaxTypeSerializer extends Serializer<TaxType> with _$TaxTypeSerializer {}

final checkoutSerializers = <Serializer>[
  OrderSerializer(),
  OrderStatusSerializer(),
  ShippingRegionSerializer(),
  ShippingRegionDetailSerializer(),
  TaxTypeSerializer(),
];
