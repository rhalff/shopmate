part of customer.models;

class _StripBearerProcessor implements FieldProcessor<String, String> {
  const _StripBearerProcessor();
  @override
  String serialize(String value) => 'Bearer $value';

  @override
  String deserialize(String value) {
    return value.substring(7);
  }
}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CustomerSerializer extends Serializer<Customer>
    with _$CustomerSerializer {}

@GenSerializer(
  fields: {
    'accessToken': Field(
      processor: const _StripBearerProcessor(),
    ),
  },
)
class CustomerResponseSerializer extends Serializer<CustomerResponse>
    with _$CustomerResponseSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CustomerSchemaSerializer extends Serializer<CustomerSchema>
    with _$CustomerSchemaSerializer {}

final customerSerializers = <Serializer>[
  CustomerSerializer(),
  CustomerResponseSerializer(),
  CustomerSchemaSerializer(),
];
