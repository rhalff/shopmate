part of catalog.models;

class ProductDetail {
  final int productId;
  final String name;
  final String description;
  final double price;
  final double discountedPrice;
  final String image;
  final String image2;

  ProductDetail({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.discountedPrice,
    this.image,
    this.image2,
  });

  List<String> get images {
    final images = <String>[];

    if (image != null) {
      images.add(image);
    }

    if (image2 != null) {
      images.add(image2);
    }

    return images;
  }

  @override
  String toString() {
    return 'ProductDetail[productId=$productId, name=$name, description=$description, price=$price, discountedPrice=$discountedPrice, image=$image, image2=$image2, ]';
  }
}
