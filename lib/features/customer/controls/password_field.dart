part of customer.controls;

class PasswordField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChange;
  final String placeholder;
  final bool autovalidate;
  PasswordField({
    Key key,
    this.autovalidate = true,
    this.focusNode,
    this.onSaved,
    this.placeholder,
    this.validator,
    this.onChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      autovalidate: autovalidate,
      obscureText: true,
      placeholder: placeholder ?? 'Password',
      textAlign: TextAlign.center,
      validator: validator,
      focusNode: focusNode,
      inputFormatters: <TextInputFormatter>[
        BlacklistingTextInputFormatter(RegExp(' ')),
      ],
      onChange: onChange,
      onSaved: onSaved,
    );
  }
}
