part of customer.controls;

class NameField extends StatelessWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final String value;
  final String placeholder;
  NameField({
    Key key,
    this.value,
    this.placeholder = 'Name',
    this.focusNode,
    this.onSaved,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomerFormField(
      value: value,
      textInputAction: TextInputAction.next,
      placeholder: placeholder,
      textAlign: TextAlign.center,
      validator: _validateName,
      focusNode: focusNode,
      inputFormatters: <TextInputFormatter>[],
      onSaved: onSaved,
    );
  }

  String _validateName(String value) {
    if (value.length > 255) {
      return 'Name cannot exceed more than 255 characters';
    }

    return null;
  }
}
