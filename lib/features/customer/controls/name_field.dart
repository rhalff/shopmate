part of customer.controls;

class NameField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final String value;
  final String placeholder;
  final FormFieldValidator<String> validator;
  NameField({
    Key key,
    this.value,
    this.placeholder = 'Name',
    this.focusNode,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      value: value,
      textInputAction: TextInputAction.next,
      placeholder: placeholder,
      textAlign: TextAlign.center,
      validator: validator,
      focusNode: focusNode,
      inputFormatters: <TextInputFormatter>[],
      onSaved: onSaved,
    );
  }
}
