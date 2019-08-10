part of customer.controls;

class EmailField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final String value;
  final bool enabled;
  final FormFieldValidator<String> validator;
  final bool autovalidate;
  final ValueChanged<String> onChange;
  EmailField({
    Key key,
    this.autovalidate = true,
    this.enabled = true,
    this.value,
    this.focusNode,
    this.onChange,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      value: value,
      autovalidate: autovalidate,
      enabled: enabled,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      placeholder: 'Email',
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
