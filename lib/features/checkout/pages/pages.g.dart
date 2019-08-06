// GENERATED CODE - DO NOT MODIFY BY HAND

part of checkout.pages;

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$DeliveryFormDataValidator
    implements Validator<DeliveryFormData> {
  static String firstNameNotEmptyMessage(Object validatedValue) {
    return 'First Name must be specified.';
  }

  static String firstNameSizeMessage(int min, int max, Object validatedValue) {
    return 'Name cannot exceed $max characters.';
  }

  static String lastNameNotEmptyMessage(Object validatedValue) {
    return 'Last name must be specified.';
  }

  static String lastNameSizeMessage(int min, int max, Object validatedValue) {
    return 'Last name cannot exceed $max characters.';
  }

  static String addressNotEmptyMessage(Object validatedValue) {
    return 'Address must be specified.';
  }

  static String cityNotEmptyMessage(Object validatedValue) {
    return 'City must be specified.';
  }

  static String stateNotEmptyMessage(Object validatedValue) {
    return 'State must be specified.';
  }

  static String zipCodeNotEmptyMessage(Object validatedValue) {
    return 'ZipCode must be specified.';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(name: 'firstName', validators: [
        NotEmptyValidator()..message = firstNameNotEmptyMessage,
        SizeValidator(min: 1, max: 255)..message = firstNameSizeMessage
      ]),
      FieldValidator<String>(name: 'lastName', validators: [
        NotEmptyValidator()..message = lastNameNotEmptyMessage,
        SizeValidator(min: 1, max: 255)..message = lastNameSizeMessage
      ]),
      FieldValidator<String>(
          name: 'address',
          validators: [NotEmptyValidator()..message = addressNotEmptyMessage]),
      FieldValidator<String>(
          name: 'city',
          validators: [NotEmptyValidator()..message = cityNotEmptyMessage]),
      FieldValidator<String>(
          name: 'state',
          validators: [NotEmptyValidator()..message = stateNotEmptyMessage]),
      FieldValidator<String>(
          name: 'zipCode',
          validators: [NotEmptyValidator()..message = zipCodeNotEmptyMessage])
    ];
  }

  String validateFirstName(Object value) => errorCheck('firstName', value);
  String validateLastName(Object value) => errorCheck('lastName', value);
  String validateAddress(Object value) => errorCheck('address', value);
  String validateCity(Object value) => errorCheck('city', value);
  String validateState(Object value) => errorCheck('state', value);
  String validateZipCode(Object value) => errorCheck('zipCode', value);
  @override
  PropertyMap<DeliveryFormData> props(DeliveryFormData instance) {
    return PropertyMap<DeliveryFormData>({
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode
    });
  }
}
