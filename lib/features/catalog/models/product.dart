part of catalog.models;

class Product {
  final int productId;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String thumbnail;

  Product({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.discountedPrice,
    this.thumbnail,
  });

  @override
  String toString() {
    return 'Product[productId=$productId, name=$name, description=$description, price=$price, discountedPrice=$discountedPrice, thumbnail=$thumbnail, ]';
  }
}
