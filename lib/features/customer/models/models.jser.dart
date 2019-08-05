// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer.models;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$CustomerSerializer implements Serializer<Customer> {
  @override
  Map<String, dynamic> toMap(Customer model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'customer_id', model.customerId);
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'address_1', model.address1);
    setMapValue(ret, 'address_2', model.address2);
    setMapValue(ret, 'city', model.city);
    setMapValue(ret, 'region', model.region);
    setMapValue(ret, 'postal_code', model.postalCode);
    setMapValue(ret, 'country', model.country);
    setMapValue(ret, 'shipping_region_id', model.shippingRegionId);
    setMapValue(ret, 'day_phone', model.dayPhone);
    setMapValue(ret, 'eve_phone', model.evePhone);
    setMapValue(ret, 'mob_phone', model.mobPhone);
    setMapValue(ret, 'credit_card', model.creditCard);
    return ret;
  }

  @override
  Customer fromMap(Map map) {
    if (map == null) return null;
    final obj = Customer(
        customerId: map['customer_id'] as int ?? getJserDefault('customerId'),
        name: map['name'] as String ?? getJserDefault('name'),
        email: map['email'] as String ?? getJserDefault('email'),
        address1: map['address_1'] as String ?? getJserDefault('address1'),
        address2: map['address_2'] as String ?? getJserDefault('address2'),
        city: map['city'] as String ?? getJserDefault('city'),
        region: map['region'] as String ?? getJserDefault('region'),
        postalCode:
            map['postal_code'] as String ?? getJserDefault('postalCode'),
        country: map['country'] as String ?? getJserDefault('country'),
        shippingRegionId: map['shipping_region_id'] as int ??
            getJserDefault('shippingRegionId'),
        dayPhone: map['day_phone'] as String ?? getJserDefault('dayPhone'),
        evePhone: map['eve_phone'] as String ?? getJserDefault('evePhone'),
        mobPhone: map['mob_phone'] as String ?? getJserDefault('mobPhone'),
        creditCard:
            map['credit_card'] as String ?? getJserDefault('creditCard'));
    return obj;
  }
}

abstract class _$CustomerResponseSerializer
    implements Serializer<CustomerResponse> {
  final __StripBearerProcessor = const _StripBearerProcessor();
  Serializer<Customer> __customerSerializer;
  Serializer<Customer> get _customerSerializer =>
      __customerSerializer ??= CustomerSerializer();
  @override
  Map<String, dynamic> toMap(CustomerResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'customer', _customerSerializer.toMap(model.customer));
    setMapValue(ret, 'accessToken',
        __StripBearerProcessor.serialize(model.accessToken));
    setMapValue(ret, 'expires_in', model.expiresIn);
    return ret;
  }

  @override
  CustomerResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = CustomerResponse(
        customer: _customerSerializer.fromMap(map['customer'] as Map) ??
            getJserDefault('customer'),
        accessToken:
            __StripBearerProcessor.deserialize(map['accessToken'] as String) ??
                getJserDefault('accessToken'),
        expiresIn: map['expires_in'] as String ?? getJserDefault('expiresIn'));
    return obj;
  }
}

abstract class _$CustomerSchemaSerializer
    implements Serializer<CustomerSchema> {
  Serializer<Customer> __customerSerializer;
  Serializer<Customer> get _customerSerializer =>
      __customerSerializer ??= CustomerSerializer();
  @override
  Map<String, dynamic> toMap(CustomerSchema model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'schema', _customerSerializer.toMap(model.schema));
    return ret;
  }

  @override
  CustomerSchema fromMap(Map map) {
    if (map == null) return null;
    final obj = CustomerSchema(
        schema: _customerSerializer.fromMap(map['schema'] as Map) ??
            getJserDefault('schema'));
    return obj;
  }
}
