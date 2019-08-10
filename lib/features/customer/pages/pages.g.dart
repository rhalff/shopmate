// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer.pages;

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

abstract class _$SignInDataValidator implements Validator<_SignInData> {
  static String passwordSizeMessage(int min, int max, Object validatedValue) {
    return 'password length must be between $min and $max';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(
          name: 'email', validators: [EmailValidator(), NotEmptyValidator()]),
      FieldValidator<String>(name: 'password', validators: [
        NotEmptyValidator(),
        SizeValidator(min: 2, max: 20)..message = passwordSizeMessage
      ])
    ];
  }

  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value) => errorCheck('password', value);
  @override
  PropertyMap<_SignInData> props(_SignInData instance) {
    return PropertyMap<_SignInData>(
        {'email': instance.email, 'password': instance.password});
  }
}

abstract class _$SignUpDataValidator implements Validator<SignUpData> {
  static String passwordSizeMessage1(int min, int max, Object validatedValue) {
    return 'password length must be between $min and $max';
  }

  static String signUpDataFieldMatchBaseFieldMessage(
      String baseField, String matchField, Object validatedValue) {
    return 'Password should match password confirmation.';
  }

  static String signUpDataFieldMatchMatchFieldMessage(
      String baseField, String matchField, Object validatedValue) {
    return 'Password confirmation should match password.';
  }

  @override
  List<FieldValidator> getFieldValidators() {
    return [
      FieldValidator<String>(
          name: 'name', validators: [SizeValidator(min: 2, max: 255)]),
      FieldValidator<String>(
          name: 'email', validators: [EmailValidator(), NotEmptyValidator()]),
      FieldValidator<String>(
          name: 'password',
          validators: [
            NotEmptyValidator(),
            SizeValidator(min: 2, max: 20)..message = passwordSizeMessage1
          ],
          validateClass: true),
      FieldValidator<String>(
          name: 'passwordConfirm',
          validators: [NotEmptyValidator()],
          validateClass: true)
    ];
  }

  String validateName(Object value) => errorCheck('name', value);
  String validateEmail(Object value) => errorCheck('email', value);
  String validatePassword(Object value, SignUpData object) =>
      crossErrorCheck(object, 'password', value);
  String validatePasswordConfirm(Object value, SignUpData object) =>
      crossErrorCheck(object, 'passwordConfirm', value);
  @override
  PropertyMap<SignUpData> props(SignUpData instance) {
    return PropertyMap<SignUpData>({
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm
    });
  }

  @override
  ClassValidator getClassValidator() {
    return ClassValidator<SignUpData>(validators: [
      FieldMatchValidator(baseField: 'password', matchField: 'passwordConfirm')
        ..affectedFields = ['password', 'passwordConfirm']
        ..baseFieldMessage = signUpDataFieldMatchBaseFieldMessage
        ..matchFieldMessage = signUpDataFieldMatchMatchFieldMessage
    ]);
  }
}
