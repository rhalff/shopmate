// GENERATED CODE - DO NOT MODIFY BY HAND

part of cart.models;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CartSerializer implements Serializer<Cart> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(Cart model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'item_id', model.itemId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'attributes', model.attributes);
    setMapValue(ret, 'product_id', model.productId);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'quantity', model.quantity);
    setMapValue(
        ret, 'subtotal', _doubleToStringProcessor.serialize(model.subtotal));
    return ret;
  }

  @override
  Cart fromMap(Map map) {
    if (map == null) return null;
    final obj = Cart(
        itemId: map['item_id'] as int ?? getJserDefault('itemId'),
        name: map['name'] as String ?? getJserDefault('name'),
        attributes: map['attributes'] as String ?? getJserDefault('attributes'),
        productId: map['product_id'] as num ?? getJserDefault('productId'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        quantity: map['quantity'] as int ?? getJserDefault('quantity'),
        subtotal:
            _doubleToStringProcessor.deserialize(map['subtotal'] as String) ??
                getJserDefault('subtotal'));
    return obj;
  }
}

abstract class _$CartIdSerializer implements Serializer<CartId> {
  @override
  Map<String, dynamic> toMap(CartId model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'cart_id', model.cartId);
    return ret;
  }

  @override
  CartId fromMap(Map map) {
    if (map == null) return null;
    final obj =
        CartId(cartId: map['cart_id'] as String ?? getJserDefault('cartId'));
    return obj;
  }
}

abstract class _$CartWithProductSerializer
    implements Serializer<CartWithProduct> {
  final _doubleToStringProcessor = const DoubleToStringProcessor();
  @override
  Map<String, dynamic> toMap(CartWithProduct model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'item_id', model.itemId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'attributes', model.attributes);
    setMapValue(ret, 'product_id', model.productId);
    setMapValue(ret, 'price', _doubleToStringProcessor.serialize(model.price));
    setMapValue(ret, 'quantity', model.quantity);
    setMapValue(ret, 'image', model.image);
    setMapValue(
        ret, 'subtotal', _doubleToStringProcessor.serialize(model.subtotal));
    return ret;
  }

  @override
  CartWithProduct fromMap(Map map) {
    if (map == null) return null;
    final obj = CartWithProduct(
        itemId: map['item_id'] as int ?? getJserDefault('itemId'),
        name: map['name'] as String ?? getJserDefault('name'),
        attributes: map['attributes'] as String ?? getJserDefault('attributes'),
        productId: map['product_id'] as int ?? getJserDefault('productId'),
        price: _doubleToStringProcessor.deserialize(map['price'] as String) ??
            getJserDefault('price'),
        quantity: map['quantity'] as int ?? getJserDefault('quantity'),
        image: map['image'] as String ?? getJserDefault('image'),
        subtotal:
            _doubleToStringProcessor.deserialize(map['subtotal'] as String) ??
                getJserDefault('subtotal'));
    return obj;
  }
}
