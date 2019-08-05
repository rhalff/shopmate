part of customer.controls;

class PasswordField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChange;
  final String placeholder;
  PasswordField({
    Key key,
    this.focusNode,
    this.onSaved,
    this.placeholder,
    this.validator,
    this.onChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      obscureText: true,
      placeholder: placeholder ?? 'Password',
      textAlign: TextAlign.center,
      validator: validator ?? _validatePassword,
      focusNode: focusNode,
      inputFormatters: <TextInputFormatter>[
        BlacklistingTextInputFormatter(RegExp(' ')),
      ],
      onChange: onChange,
      onSaved: onSaved,
    );
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }
}
