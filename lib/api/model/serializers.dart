part of api.model;

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ApiErrorSerializer extends Serializer<ApiError>
    with _$ApiErrorSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class NotFoundSerializer extends Serializer<NotFound>
    with _$NotFoundSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class UnauthorizedSerializer extends Serializer<Unauthorized>
    with _$UnauthorizedSerializer {}

final apiSerializers = <Serializer>[
  ApiErrorSerializer(),
  NotFoundSerializer(),
  UnauthorizedSerializer(),
];
