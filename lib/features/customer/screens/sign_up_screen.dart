part of customer.screens;

class SignUpScreen extends StatefulWidget {
  static const route = '/customer/register';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  CustomerBloc _customerBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _authBloc,
      listener: (BuildContext context, AuthState state) {
        if (state is Authenticated) {
          Navigator.of(context).pop();
        }
      },
      child: BlocBuilder(
        bloc: _customerBloc,
        builder: (BuildContext context, CustomerState state) {
          String error;
          if (state is CustomerSigningUp) {
            return CustomerPage(
              title: 'Signing up...',
              child: CircularProgressIndicator(),
            );
          } else if (state is CustomerError) {
            error = state.error;
          }

          return CustomerPage(
            title: 'Sign Up',
            child: SignUpForm(error: error),
          );
        },
      ),
    );
  }
}
