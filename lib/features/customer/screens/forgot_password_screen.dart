part of customer.screens;

class ForgotPasswordScreen extends StatefulWidget {
  static const route = '/customer/forgot_password';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomerPage(
      title: 'Forgot Password',
      child: ForgotPasswordScreenForm(),
    );
  }
}

class ForgotPasswordScreenForm extends StatefulWidget {
  @override
  _ForgotPasswordScreenFormState createState() =>
      _ForgotPasswordScreenFormState();
}

class _ForgotPasswordScreenFormState extends State<ForgotPasswordScreenForm> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
