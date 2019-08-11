part of customer.pages;

class _SignInData {
  @Email()
  @NotEmpty()
  String email;

  @NotEmpty()
  @Size(
    min: 2,
    max: 20,
    message: r'password length must be between $min and $max',
  )
  String password;

  bool rememberMe = false;
}

@GenValidator()
class SignInDataValidator extends Validator<_SignInData>
    with _$SignInDataValidator {}

class SignInForm extends StatefulWidget {
  final String error;
  SignInForm({this.error});
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _data = _SignInData();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  CustomerBloc _customerBloc;
  SignInDataValidator _validator;

  @override
  void initState() {
    super.initState();

    _validator = SignInDataValidator();

    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm(context);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          if (widget.error != null)
            ErrorContainer(
              error: widget.error,
            ),
          EmailField(
            autovalidate: false,
            focusNode: _emailFocus,
            validator: _validator.validateEmail,
            onChange: (value) {},
            onSaved: (String value) {
              _data.email = value;
            },
          ),
          PasswordField(
            autovalidate: false,
            focusNode: _passwordFocus,
            validator: _validator.validatePassword,
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
          const SizedBox(height: 25),
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            direction: Axis.horizontal,
            runSpacing: 20,
            children: <Widget>[
              Link(
                const LinkItem(
                  title: 'Forgot password',
                  route: ForgotPasswordScreen.route,
                  replace: true,
                ),
              ),
              const SizedBox(width: 15),
              NavLink(
                const LinkItem(
                  title: 'Have an account',
                  route: SignUpScreen.route,
                  replace: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState.validate()) {
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
