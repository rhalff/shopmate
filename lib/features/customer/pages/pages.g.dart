// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer.pages;

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$SignUpDataValidator implements Validator<SignUpData> {
  static String SignUpDataFieldMatchMessage(
      String baseField, String matchField, Object validatedValue) {
    return 'The password fields do not match';
  }

  @override
  ClassValidator getClassValidator() {
    return ClassValidator<SignUpData>(validators: [
      FieldMatchValidator(baseField: 'password', matchField: 'passwordConfirm')
        ..message = SignUpDataFieldMatchMessage
    ]);
  }

  static String passwordSizeMessage(int min, int max, Object validatedValue) {
    return 'password length must be between $min and $max';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(
          name: 'name', validators: [SizeValidator(min: 2, max: 255)]),
      FieldValidator<String>(
          name: 'email', validators: [EmailValidator(), NotEmptyValidator()]),
      FieldValidator<String>(name: 'password', validators: [
        NotEmptyValidator(),
        SizeValidator(min: 2, max: 20)..message = passwordSizeMessage
      ]),
      FieldValidator<String>(
          name: 'passwordConfirm', validators: [NotEmptyValidator()])
    ];
  }

  String validateName(Object value) => errorCheck('name', value);
  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
  String validatePasswordConfirm(Object value) =>
      errorCheck('passwordConfirm', value);
  String validateSignUpData(Object value) => errorCheck('SignUpData', value);
  @override
  Map<String, dynamic> props(SignUpData instance) {
    return {
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm
    };
  }
}
