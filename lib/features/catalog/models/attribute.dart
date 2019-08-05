part of catalog.models;

class Attribute {
  final int attributeId;
  final String name;

  Attribute({
    this.attributeId,
    this.name,
  });

  @override
  String toString() {
    return 'Attribute[attribute_id=$attributeId, name=$name, ]';
  }
}
