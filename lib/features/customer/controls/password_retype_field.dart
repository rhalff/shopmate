part of customer.controls;

class PasswordRetypeField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final bool autovalidate;
  final ValueChanged<String> onChange;
  PasswordRetypeField({
    Key key,
    this.autovalidate = true,
    this.focusNode,
    this.validator,
    this.onChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PasswordField(
      autovalidate: autovalidate,
      placeholder: 'Re-type password',
      validator: validator,
      focusNode: focusNode,
      onChange: onChange,
    );
  }
}
