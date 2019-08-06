part of customer.pages;

@FieldMatch(
  baseField: 'password',
  matchField: 'passwordConfirm',
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
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = SignUpData();
  CustomerBloc _customerBloc;

  @override
  void initState() {
    super.initState();

    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          NameField(
            // focusNode: _emailFocus,
            onSaved: (String value) {
              setState(() {
                _data.name = value;
              });
            },
          ),
          EmailField(
            // focusNode: _emailFocus,
            onSaved: (String value) {
              setState(() {
                _data.email = value;
              });
            },
          ),
          PasswordField(
            // focusNode: _passwordFocus,
            onChange: (String value) {
              setState(() {
                _data.password = value;
              });
            },
            onSaved: (String value) {
              setState(() {
                _data.passwordConfirm = value;
              });
            },
          ),
          PasswordRetypeField(
            password: _data.password,
            // focusNode: _reviewFocus,
          ),
          SizedBox(height: 10),
          RoundedButton(
            text: 'Sign Up',
            onPressed: _signUp,
          ),
          SizedBox(height: 25),
          Wrap(
            // mainAxisSize: MainAxisSize.min,
            direction: Axis.horizontal,
            children: <Widget>[
              Text('Already a member?'),
              SizedBox(width: 15),
              NavLink(LinkItem(
                title: 'Sign In',
                route: SignInScreen.route,
                replace: true,
              )),
            ],
          ),
          SizedBox(height: 25),
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
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
