// GENERATED CODE - DO NOT MODIFY BY HAND

part of catalog.models;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$GetProductsResponseSerializer
    implements Serializer<GetProductsResponse> {
  Serializer<Product> __productSerializer;
  Serializer<Product> get _productSerializer =>
      __productSerializer ??= ProductSerializer();
  @override
  Map<String, dynamic> toMap(GetProductsResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'count', model.count);
    setMapValue(
        ret,
        'rows',
        codeIterable(
            model.rows, (val) => _productSerializer.toMap(val as Product)));
    return ret;
  }

  @override
  GetProductsResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = GetProductsResponse(
        count: map['count'] as int ?? getJserDefault('count'),
        rows: codeIterable<Product>(map['rows'] as Iterable,
                (val) => _productSerializer.fromMap(val as Map)) ??
            getJserDefault('rows'));
    return obj;
  }
}

abstract class _$AttributeSerializer implements Serializer<Attribute> {
  @override
  Map<String, dynamic> toMap(Attribute model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'attribute_id', model.attributeId);
    setMapValue(ret, 'name', model.name);
    return ret;
  }

  @override
  Attribute fromMap(Map map) {
    if (map == null) return null;
    final obj = Attribute(
        attributeId:
            map['attribute_id'] as int ?? getJserDefault('attributeId'),
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}

abstract class _$AttributeValueSerializer
    implements Serializer<AttributeValue> {
  @override
  Map<String, dynamic> toMap(AttributeValue model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'attribute_value_id', model.attributeValueId);
    setMapValue(ret, 'value', model.value);
    return ret;
  }

  @override
  AttributeValue fromMap(Map map) {
    if (map == null) return null;
    final obj = AttributeValue(
        attributeValueId: map['attribute_value_id'] as int ??
            getJserDefault('attributeValueId'),
        value: map['value'] as String ?? getJserDefault('value'));
    return obj;
  }
}

abstract class _$CategorySerializer implements Serializer<Category> {
  @override
  Map<String, dynamic> toMap(Category model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'category_id', model.categoryId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'department_id', model.departmentId);
    return ret;
  }

  @override
  Category fromMap(Map map) {
    if (map == null) return null;
    final obj = Category(
        categoryId: map['category_id'] as int ?? getJserDefault('categoryId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        departmentId:
            map['department_id'] as int ?? getJserDefault('departmentId'));
    return obj;
  }
}

abstract class _$CategoryBasicSerializer implements Serializer<CategoryBasic> {
  @override
  Map<String, dynamic> toMap(CategoryBasic model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'category_id', model.categoryId);
    setMapValue(ret, 'department_id', model.departmentId);
    setMapValue(ret, 'name', model.name);
    return ret;
  }

  @override
  CategoryBasic fromMap(Map map) {
    if (map == null) return null;
    final obj = CategoryBasic(
        categoryId: map['category_id'] as int ?? getJserDefault('categoryId'),
        departmentId:
            map['department_id'] as int ?? getJserDefault('departmentId'),
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}

abstract class _$DepartmentSerializer implements Serializer<Department> {
  @override
  Map<String, dynamic> toMap(Department model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'department_id', model.departmentId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    return ret;
  }

  @override
  Department fromMap(Map map) {
    if (map == null) return null;
    final obj = Department(
        departmentId:
            map['department_id'] as int ?? getJserDefault('departmentId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'));
    return obj;
  }
}

abstract class _$FavoriteSerializer implements Serializer<Favorite> {
  @override
  Map<String, dynamic> toMap(Favorite model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'item_id', model.itemId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'attributes', model.attributes);
    setMapValue(ret, 'price', model.price);
    return ret;
  }

  @override
  Favorite fromMap(Map map) {
    if (map == null) return null;
    final obj = Favorite(
        itemId: map['item_id'] as String ?? getJserDefault('itemId'),
        name: map['name'] as String ?? getJserDefault('name'),
        attributes: map['attributes'] as String ?? getJserDefault('attributes'),
        price: map['price'] as String ?? getJserDefault('price'));
    return obj;
  }
}

abstract class _$ProductSerializer implements Serializer<Product> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(Product model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'product_id', model.productId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'discounted_price',
        _doubleToStringProcessor.serialize(model.discountedPrice));
    setMapValue(ret, 'thumbnail', model.thumbnail);
    return ret;
  }

  @override
  Product fromMap(Map map) {
    if (map == null) return null;
    final obj = Product(
        productId: map['product_id'] as int ?? getJserDefault('productId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        discountedPrice: _doubleToStringProcessor
                .deserialize(map['discounted_price'] as String) ??
            getJserDefault('discountedPrice'),
        thumbnail: map['thumbnail'] as String ?? getJserDefault('thumbnail'));
    return obj;
  }
}

abstract class _$ProductAttributeSerializer
    implements Serializer<ProductAttribute> {
  @override
  Map<String, dynamic> toMap(ProductAttribute model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'attribute_name', model.name);
    setMapValue(ret, 'attribute_value_id', model.valueId);
    setMapValue(ret, 'attribute_value', model.value);
    return ret;
  }

  @override
  ProductAttribute fromMap(Map map) {
    if (map == null) return null;
    final obj = ProductAttribute(
        name: map['attribute_name'] as String ?? getJserDefault('name'),
        valueId: map['attribute_value_id'] as int ?? getJserDefault('valueId'),
        value: map['attribute_value'] as String ?? getJserDefault('value'));
    return obj;
  }
}

abstract class _$ProductCompleteSerializer
    implements Serializer<ProductComplete> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(ProductComplete model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'productId', model.productId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'discountedPrice',
        _doubleToStringProcessor.serialize(model.discountedPrice));
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'image2', model.image2);
    setMapValue(ret, 'thumbnail', model.thumbnail);
    setMapValue(ret, 'display', model.display);
    return ret;
  }

  @override
  ProductComplete fromMap(Map map) {
    if (map == null) return null;
    final obj = ProductComplete(
        productId: map['productId'] as int ?? getJserDefault('productId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        discountedPrice: _doubleToStringProcessor
                .deserialize(map['discountedPrice'] as String) ??
            getJserDefault('discountedPrice'),
        image: map['image'] as String ?? getJserDefault('image'),
        image2: map['image2'] as String ?? getJserDefault('image2'),
        thumbnail: map['thumbnail'] as String ?? getJserDefault('thumbnail'),
        display: map['display'] as int ?? getJserDefault('display'));
    return obj;
  }
}

abstract class _$ProductDetailSerializer implements Serializer<ProductDetail> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(ProductDetail model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret, 'images', codeIterable(model.images, (val) => val as String));
    setMapValue(ret, 'product_id', model.productId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'discounted_price',
        _doubleToStringProcessor.serialize(model.discountedPrice));
    setMapValue(ret, 'image', model.image);
    setMapValue(ret, 'image_2', model.image2);
    return ret;
  }

  @override
  ProductDetail fromMap(Map map) {
    if (map == null) return null;
    final obj = ProductDetail(
        productId: map['product_id'] as int ?? getJserDefault('productId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        discountedPrice: _doubleToStringProcessor
                .deserialize(map['discounted_price'] as String) ??
            getJserDefault('discountedPrice'),
        image: map['image'] as String ?? getJserDefault('image'),
        image2: map['image_2'] as String ?? getJserDefault('image2'));
    return obj;
  }
}

abstract class _$ProductInDepartmentSerializer
    implements Serializer<ProductInDepartment> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(ProductInDepartment model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'productId', model.productId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'description', model.description);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'discountedPrice',
        _doubleToStringProcessor.serialize(model.discountedPrice));
    setMapValue(ret, 'thumbnail', model.thumbnail);
    setMapValue(ret, 'display', model.display);
    return ret;
  }

  @override
  ProductInDepartment fromMap(Map map) {
    if (map == null) return null;
    final obj = ProductInDepartment(
        productId: map['productId'] as int ?? getJserDefault('productId'),
        name: map['name'] as String ?? getJserDefault('name'),
        description:
            map['description'] as String ?? getJserDefault('description'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        discountedPrice: _doubleToStringProcessor
                .deserialize(map['discountedPrice'] as String) ??
            getJserDefault('discountedPrice'),
        thumbnail: map['thumbnail'] as String ?? getJserDefault('thumbnail'),
        display: map['display'] as String ?? getJserDefault('display'));
    return obj;
  }
}

abstract class _$ProductLocationsSerializer
    implements Serializer<ProductLocations> {
  @override
  Map<String, dynamic> toMap(ProductLocations model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'category_id', model.categoryId);
    setMapValue(ret, 'category_name', model.categoryName);
    setMapValue(ret, 'department_id', model.departmentId);
    setMapValue(ret, 'department_name', model.departmentName);
    return ret;
  }

  @override
  ProductLocations fromMap(Map map) {
    if (map == null) return null;
    final obj = ProductLocations(
        categoryId: map['category_id'] as int ?? getJserDefault('categoryId'),
        categoryName:
            map['category_name'] as String ?? getJserDefault('categoryName'),
        departmentId:
            map['department_id'] as int ?? getJserDefault('departmentId'),
        departmentName: map['department_name'] as String ??
            getJserDefault('departmentName'));
    return obj;
  }
}

abstract class _$ReviewSerializer implements Serializer<Review> {
  @override
  Map<String, dynamic> toMap(Review model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'review', model.review);
    setMapValue(ret, 'rating', model.rating);
    setMapValue(ret, 'created_on', model.createdOn);
    return ret;
  }

  @override
  Review fromMap(Map map) {
    if (map == null) return null;
    final obj = Review(
        name: map['name'] as String ?? getJserDefault('name'),
        review: map['review'] as String ?? getJserDefault('review'),
        rating: map['rating'] as int ?? getJserDefault('rating'),
        createdOn: map['created_on'] as String ?? getJserDefault('createdOn'));
    return obj;
  }
}
