part of catalog.models;

class FullProductDetails {
  final ProductDetail product;
  final List<Review> reviews;
  final List<ProductAttribute> attributes;

  FullProductDetails({
    this.product,
    this.reviews = const [],
    this.attributes = const [],
  });

  double get rating {
    var count = 0;

    for (var i = 0; i < reviews.length; i++) {
      count += reviews[i].rating;
    }

    return count / reviews.length;
  }

  List<ProductColor> get colors {
    return _getAttributeList('Color').map((color) {
      return ProductColor(
        id: color.valueId,
        value: color.value,
        color: _mapColor(color.value),
      );
    }).toList();
  }

  Color _mapColor(String color) {
    final colorMap = {
      'Blue': Colors.blue,
      'Black': Colors.black,
      'Green': Colors.green,
      'Indigo': Colors.indigo,
      'Orange': Colors.orange,
      'Purple': Colors.purple,
      'Red': Colors.red,
      'Yellow': Colors.yellow,
      'White': Colors.white,
    };
    if (colorMap[color] != null) {
      return colorMap[color];
    }

    throw Exception('Could not convert color $color');
  }

  ProductAttribute getAttribute(String name) {
    return attributes.firstWhere(
      (element) => element.name == name,
      orElse: () => null,
    );
  }

  List<ProductAttribute> get sizes {
    return _getAttributeList('Size');
  }

  List<ProductAttribute> _getAttributeList(String name) {
    return attributes.where((attribute) {
      return attribute.name == name;
    }).toList();
  }
}
