part of cart.models;

@GenSerializer(
  nameFormatter: toSnakeCase,
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'subtotal': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class CartSerializer extends Serializer<Cart> with _$CartSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CartIdSerializer extends Serializer<CartId> with _$CartIdSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'subtotal': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class CartWithProductSerializer extends Serializer<CartWithProduct>
    with _$CartWithProductSerializer {}

final cartSerializers = <Serializer>[
  CartSerializer(),
  CartIdSerializer(),
  CartWithProductSerializer(),
];
