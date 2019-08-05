part of catalog.models;

class ProductInDepartment {
  final int productId;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String thumbnail;
  final String display;

  ProductInDepartment({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.discountedPrice,
    this.thumbnail,
    this.display,
  });

  @override
  String toString() {
    return 'ProductInDepartment[productId=$productId, name=$name, description=$description, price=$price, discountedPrice=$discountedPrice, thumbnail=$thumbnail, display=$display, ]';
  }
}
