part of catalog.models;

class AttributeValue {
  final int attributeValueId;
  final String value;

  AttributeValue({
    this.attributeValueId,
    this.value,
  });

  @override
  String toString() {
    return 'AttributeValue[attributeValueId=$attributeValueId, value=$value, ]';
  }
}
