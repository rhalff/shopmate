part of customer.pages;

@FieldMatch(
  baseField: 'password',
  matchField: 'passwordConfirm',
  baseFieldMessage: 'Password should match password confirmation.',
  matchFieldMessage: 'Password confirmation should match password.',
)
class SignUpData {
  @Size(
    min: 2,
    max: 255,
  )
  String name;

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

  @NotEmpty()
  String passwordConfirm;
}

@GenValidator()
class SignUpDataValidator extends Validator<SignUpData>
    with _$SignUpDataValidator {}

class SignUpForm extends StatefulWidget {
  final String error;
  SignUpForm({this.error});
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = SignUpData();
  CustomerBloc _customerBloc;
  SignUpDataValidator _validator;

  @override
  void initState() {
    super.initState();

    _validator = SignUpDataValidator();

    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          if (widget.error != null)
            ErrorContainer(
              error: widget.error,
            ),
          NameField(
            // focusNode: _emailFocus,
            validator: _validator.validateName,
            onSaved: (String value) {
              setState(() {
                _data.name = value;
              });
            },
          ),
          EmailField(
            // focusNode: _emailFocus,
            autovalidate: false,
            validator: _validator.validateEmail,
            onSaved: (String value) {
              setState(() {
                _data.email = value;
              });
            },
          ),
          PasswordField(
            autovalidate: false,
            // focusNode: _passwordFocus,
            onChange: (String value) {
              _data.password = value;
            },
            validator: (value) => _validator.validatePassword(value, _data),
          ),
          PasswordRetypeField(
            autovalidate: false,
            onChange: (String value) {
              _data.passwordConfirm = value;
            },
            validator: (value) =>
                _validator.validatePasswordConfirm(value, _data),
            // focusNode: _reviewFocus,
          ),
          const SizedBox(height: 10),
          RoundedButton(
            text: 'Sign Up',
            onPressed: _signUp,
          ),
          const SizedBox(height: 25),
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            direction: Axis.horizontal,
            children: <Widget>[
              const Text('Already a member?'),
              const SizedBox(width: 15),
              NavLink(
                const LinkItem(
                  title: 'Sign In',
                  route: SignInScreen.route,
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

  void _signUp() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _customerBloc.dispatch(
        SignUp(
          name: _data.name,
          email: _data.email,
          password: _data.password,
        ),
      );

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: const Text('Processing Data')));
    }
  }
}
