part of catalog.models;

class ProductComplete {
  final int productId;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String image;
  final String image2;
  final String thumbnail;
  final int display;

  ProductComplete({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.discountedPrice,
    this.image,
    this.image2,
    this.thumbnail,
    this.display,
  });

  @override
  String toString() {
    return 'ProductComplete[productId=$productId, name=$name, description=$description, price=$price, discountedPrice=$discountedPrice, image=$image, image2=$image2, thumbnail=$thumbnail, display=$display, ]';
  }
}
