// GENERATED CODE - DO NOT MODIFY BY HAND

part of checkout.models;

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$OrderValidator implements Validator<Order> {
  static String productNameSizeMessage(
      int min, int max, Object validatedValue) {
    return 'Product Name must be between $min and $max characters.';
  }

  static String quantityMinMessage(dynamic value, Object validatedValue) {
    return 'Quantity must at least be 1';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'productName', validators: [
        SizeValidator(min: 2, max: 255)..message = productNameSizeMessage
      ]),
      FieldValidator<int>(
          name: 'quantity',
          validators: [MinValidator(value: 1)..message = quantityMinMessage])
    ];
  }

  String validateProductName(Object value) => errorCheck('productName', value);
  String validateQuantity(Object value) => errorCheck('quantity', value);
  @override
  PropertyMap<Order> props(Order instance) {
    return PropertyMap<Order>(
        {'productName': instance.productName, 'quantity': instance.quantity});
  }
}
