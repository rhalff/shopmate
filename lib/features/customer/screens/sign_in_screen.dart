part of customer.screens;

class SignInScreen extends StatefulWidget {
  static const route = '/customer/signin';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  CustomerBloc _customerBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context)
      ..dispatch(ClearCustomerData());
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
          if (state is CustomerSigningIn) {
            return CustomerPage(
              title: 'Signing in...',
              child: const CircularProgressIndicator(),
            );
          } else if (state is CustomerError) {
            // should already be an object, not a json string.
            error = state.error;
          }

          return CustomerPage(
            title: 'Sign In',
            child: SignInForm(error: error),
          );
        },
      ),
    );
  }
}
