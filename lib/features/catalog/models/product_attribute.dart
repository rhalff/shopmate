part of catalog.models;

class ProductAttribute {
  @Alias('attribute_name')
  final String name;
  @Alias('attribute_value_id')
  final int valueId;
  @Alias('attribute_value')
  final String value;

  ProductAttribute({
    this.name,
    this.valueId,
    this.value,
  });

  @override
  String toString() {
    return 'ProductAttribute[name=$name, valueId=$valueId, Value=$value, ]';
  }
}
