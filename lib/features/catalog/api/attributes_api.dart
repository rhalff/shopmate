part of catalog.api;

@GenApiClient(path: '/attributes')
class AttributesApi extends ApiClient with _$AttributesApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  AttributesApi({
    this.base,
    this.converters,
  });

  /// Get Attribute by id
  ///
  ///
  @GetReq(path: '/:attribute_id')
  Future<List<Attribute>> getAttributeById(
    @PathParam('attribute_id') int attributeId,
  );

  /// Get Attribute list
  ///
  ///
  @GetReq(path: '/')
  Future<List<Attribute>> getAttributes();

  /// Get all Attributes with Product ID
  ///
  ///
  @GetReq(path: '/inProduct/:product_id')
  Future<List<ProductAttribute>> getAttributesByProductId(
    @PathParam('product_id') int productId,
  );

  /// Get Values Attribute from Attribute
  ///
  ///
  @GetReq(path: '/values/:attribute_id')
  Future<AttributeValue> getAttributeValues(
    @PathParam('attribute_id') int attributeId,
  );
}
