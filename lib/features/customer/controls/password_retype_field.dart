part of customer.controls;

class PasswordRetypeField extends StatelessWidget {
  final FocusNode focusNode;
  final String password;
  PasswordRetypeField({
    Key key,
    this.password,
    this.focusNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PasswordField(
      placeholder: 'Re-type password',
      validator: _validateRetypePassword,
      focusNode: focusNode,
    );
  }

  String _validateRetypePassword(String value) {
    if (value != password) {
      return 'Passwords do not match.';
    }

    return null;
  }
}
