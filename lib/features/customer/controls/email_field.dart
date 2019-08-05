part of customer.controls;

class EmailField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final String value;
  final bool enabled;
  EmailField({
    Key key,
    this.enabled = true,
    this.value,
    this.focusNode,
    this.onSaved,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      value: value,
      enabled: enabled,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      placeholder: 'Email',
      textAlign: TextAlign.center,
      validator: _validateEmail,
      focusNode: focusNode,
      inputFormatters: <TextInputFormatter>[
        BlacklistingTextInputFormatter(RegExp(' ')),
      ],
      onSaved: onSaved,
    );
  }

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }
}
