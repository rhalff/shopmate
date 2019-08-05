part of customer.pages;

class _SignInData {
  String email = '';
  String password = '';
  bool rememberMe = false;
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _data = _SignInData();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  CustomerBloc _customerBloc;

  @override
  void initState() {
    super.initState();

    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      onChanged: () {
        _formKey.currentState.validate();
      },
      key: _formKey,
      child: Column(
        children: <Widget>[
          EmailField(
            focusNode: _emailFocus,
            onSaved: (String value) {
              _data.email = value;
            },
          ),
          PasswordField(
            focusNode: _passwordFocus,
            onSaved: (String value) {
              _data.password = value;
            },
          ),
          RememberMe(
            value: _data.rememberMe,
            onSaved: (bool value) => setState(() => _data.rememberMe = value),
          ),
          RoundedButton(
            text: 'Sign In',
            onPressed: _signIn,
          ),
          SizedBox(height: 25),
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            direction: Axis.horizontal,
            runSpacing: 20,
            children: <Widget>[
              Link(
                LinkItem(
                  title: 'Forgot password',
                  route: ForgotPasswordScreen.route,
                  replace: true,
                ),
              ),
              SizedBox(width: 15),
              NavLink(
                LinkItem(
                  title: 'Have an account',
                  route: SignUpScreen.route,
                  replace: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }

  void _signIn() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      _customerBloc.dispatch(
        SignIn(
          email: _data.email,
          password: _data.password,
        ),
      );
    }
  }
}
