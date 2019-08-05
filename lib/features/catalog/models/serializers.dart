part of catalog.models;

@GenSerializer()
class GetProductsResponseSerializer extends Serializer<GetProductsResponse>
    with _$GetProductsResponseSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class AttributeSerializer extends Serializer<Attribute>
    with _$AttributeSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class AttributeValueSerializer extends Serializer<AttributeValue>
    with _$AttributeValueSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CategorySerializer extends Serializer<Category>
    with _$CategorySerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class CategoryBasicSerializer extends Serializer<CategoryBasic>
    with _$CategoryBasicSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class DepartmentSerializer extends Serializer<Department>
    with _$DepartmentSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class FavoriteSerializer extends Serializer<Favorite>
    with _$FavoriteSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'discountedPrice': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class ProductSerializer extends Serializer<Product> with _$ProductSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ProductAttributeSerializer extends Serializer<ProductAttribute>
    with _$ProductAttributeSerializer {}

@GenSerializer(
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'discountedPrice': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class ProductCompleteSerializer extends Serializer<ProductComplete>
    with _$ProductCompleteSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'discountedPrice': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class ProductDetailSerializer extends Serializer<ProductDetail>
    with _$ProductDetailSerializer {}

@GenSerializer(
  fields: {
    'price': Field(
      processor: doubleToStringProcessor,
    ),
    'discountedPrice': Field(
      processor: doubleToStringProcessor,
    ),
  },
)
class ProductInDepartmentSerializer extends Serializer<ProductInDepartment>
    with _$ProductInDepartmentSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ProductLocationsSerializer extends Serializer<ProductLocations>
    with _$ProductLocationsSerializer {}

@GenSerializer(
  nameFormatter: toSnakeCase,
)
class ReviewSerializer extends Serializer<Review> with _$ReviewSerializer {}

final catalogSerializers = <Serializer>[
  GetProductsResponseSerializer(),
  AttributeSerializer(),
  AttributeValueSerializer(),
  CategorySerializer(),
  CategoryBasicSerializer(),
  DepartmentSerializer(),
  FavoriteSerializer(),
  ProductSerializer(),
  ProductAttributeSerializer(),
  ProductCompleteSerializer(),
  ProductDetailSerializer(),
  ProductInDepartmentSerializer(),
  ProductLocationsSerializer(),
  ReviewSerializer()
];
