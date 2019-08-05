// GENERATED CODE - DO NOT MODIFY BY HAND

part of checkout.models;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$OrderSerializer implements Serializer<Order> {
  Serializer<ProductAttribute> __productAttributeSerializer;
  Serializer<ProductAttribute> get _productAttributeSerializer =>
      __productAttributeSerializer ??= ProductAttributeSerializer();
  @override
  Map<String, dynamic> toMap(Order model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'order_id', model.orderId);
    setMapValue(ret, 'product_id', model.productId);
    setMapValue(
        ret,
        'attributes',
        codeIterable(
            model.attributes,
            (val) =>
                _productAttributeSerializer.toMap(val as ProductAttribute)));
    setMapValue(ret, 'product_name', model.productName);
    setMapValue(ret, 'quantity', model.quantity);
    setMapValue(ret, 'unit_cost', model.unitCost);
    setMapValue(ret, 'subtotal', model.subtotal);
    return ret;
  }

  @override
  Order fromMap(Map map) {
    if (map == null) return null;
    final obj = Order(
        orderId: map['order_id'] as int ?? getJserDefault('orderId'),
        productId: map['product_id'] as int ?? getJserDefault('productId'),
        attributes: codeIterable<ProductAttribute>(
                map['attributes'] as Iterable,
                (val) => _productAttributeSerializer.fromMap(val as Map)) ??
            getJserDefault('attributes'),
        productName:
            map['product_name'] as String ?? getJserDefault('productName'),
        quantity: map['quantity'] as int ?? getJserDefault('quantity'),
        unitCost: map['unit_cost'] as double ?? getJserDefault('unitCost'),
        subtotal: map['subtotal'] as double ?? getJserDefault('subtotal'));
    return obj;
  }
}

abstract class _$OrderStatusSerializer implements Serializer<OrderStatus> {
  @override
  Map<String, dynamic> toMap(OrderStatus model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'order_id', model.orderId);
    setMapValue(ret, 'total_amount', model.totalAmount);
    setMapValue(ret, 'created_on', model.createdOn);
    setMapValue(ret, 'shipped_on', model.shippedOn);
    setMapValue(ret, 'paid', model.paid);
    setMapValue(ret, 'name', model.name);
    return ret;
  }

  @override
  OrderStatus fromMap(Map map) {
    if (map == null) return null;
    final obj = OrderStatus(
        orderId: map['order_id'] as int ?? getJserDefault('orderId'),
        totalAmount:
            map['total_amount'] as int ?? getJserDefault('totalAmount'),
        createdOn: map['created_on'] as String ?? getJserDefault('createdOn'),
        shippedOn: map['shipped_on'] as String ?? getJserDefault('shippedOn'),
        paid: map['paid'] as String ?? getJserDefault('paid'),
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}

abstract class _$ShippingRegionSerializer
    implements Serializer<ShippingRegion> {
  @override
  Map<String, dynamic> toMap(ShippingRegion model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'shipping_region_id', model.shippingRegionId);
    setMapValue(ret, 'shipping_region', model.shippingRegion);
    return ret;
  }

  @override
  ShippingRegion fromMap(Map map) {
    if (map == null) return null;
    final obj = ShippingRegion(
        shippingRegionId: map['shipping_region_id'] as int ??
            getJserDefault('shippingRegionId'),
        shippingRegion: map['shipping_region'] as String ??
            getJserDefault('shippingRegion'));
    return obj;
  }
}

abstract class _$ShippingRegionDetailSerializer
    implements Serializer<ShippingRegionDetail> {
  @override
  Map<String, dynamic> toMap(ShippingRegionDetail model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'shipping_id', model.shippingId);
    setMapValue(ret, 'shipping_type', model.shippingType);
    setMapValue(ret, 'shipping_cost', model.shippingCost);
    setMapValue(ret, 'shipping_region_id', model.shippingRegionId);
    return ret;
  }

  @override
  ShippingRegionDetail fromMap(Map map) {
    if (map == null) return null;
    final obj = ShippingRegionDetail(
        shippingId: map['shipping_id'] as int ?? getJserDefault('shippingId'),
        shippingType:
            map['shipping_type'] as String ?? getJserDefault('shippingType'),
        shippingCost:
            map['shipping_cost'] as String ?? getJserDefault('shippingCost'),
        shippingRegionId: map['shipping_region_id'] as int ??
            getJserDefault('shippingRegionId'));
    return obj;
  }
}

abstract class _$TaxTypeSerializer implements Serializer<TaxType> {
  @override
  Map<String, dynamic> toMap(TaxType model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'tax_id', model.taxId);
    setMapValue(ret, 'tax_type', model.taxType);
    setMapValue(ret, 'tax_percentage', model.taxPercentage);
    return ret;
  }

  @override
  TaxType fromMap(Map map) {
    if (map == null) return null;
    final obj = TaxType(
        taxId: map['tax_id'] as int ?? getJserDefault('taxId'),
        taxType: map['tax_type'] as String ?? getJserDefault('taxType'),
        taxPercentage:
            map['tax_percentage'] as String ?? getJserDefault('taxPercentage'));
    return obj;
  }
}
