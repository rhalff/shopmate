part of catalog.models;

class Favorite {
  final String itemId;
  final String name;
  final String attributes;
  final String price;

  Favorite({
    this.itemId,
    this.name,
    this.attributes,
    this.price,
  });

  @override
  String toString() {
    return 'Favorite[itemId=$itemId, name=$name, attributes=$attributes, price=$price, ]';
  }
}
