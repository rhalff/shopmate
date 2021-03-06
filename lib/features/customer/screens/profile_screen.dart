part of customer.screens;

class ProfileScreen extends StatefulWidget {
  static const route = '/customer/update';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CustomerBloc _customerBloc;

  @override
  void initState() {
    super.initState();

    _customerBloc = BlocProvider.of<CustomerBloc>(context)
      ..dispatch(LoadCustomer());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _customerBloc,
      builder: (BuildContext context, CustomerState state) {
        if (state is CustomerLoading) {
          return CustomerPage(
            child: const CircularProgressIndicator(),
          );
        } else if (state is CustomerError) {
          return ErrorContainer(
            error: state.error.toString(),
          );
        }

        return CustomerPage(
          title: 'Profile',
          child: ProfileForm(),
        );
      },
    );
  }
}

class ProfileData {
  String name;
  String email;
  String address1;
  String address2;
  String city;
  String region;
  String postalCode;
  String country;
  int shippingRegionId;
  String dayPhone;
  String evePhone;
  String mobPhone;
  String creditCard;
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _data = Profile();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  CustomerBloc _customerBloc;

  @override
  void initState() {
    super.initState();

    _customerBloc = BlocProvider.of<CustomerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _customerBloc,
      builder: (BuildContext context, CustomerState state) {
        if (state is CustomerLoaded) {
          return _buildForm(context, state.customer);
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Widget _buildForm(
    BuildContext context,
    Customer customer,
  ) {
    return Form(
      key: _formKey,
      onChanged: () {
        _formKey.currentState.validate();
      },
      child: Column(
        children: <Widget>[
          _buildProfileFields(customer),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 30),
              RoundedButton(
                text: 'Update',
                onPressed: _update,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProfileFields(Customer customer) {
    return Column(
      children: <Widget>[
        NameField(
          value: customer.name,
          focusNode: _nameFocus,
          onSaved: (String value) {
            _data.name = value;
          },
        ),
        EmailField(
          enabled: false,
          value: customer.email,
          focusNode: _emailFocus,
          onSaved: (String value) {
            _data.email = value;
          },
        ),
      ],
    );
  }

  void _update() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _customerBloc.dispatch(UpdateCustomer(_data));
    }
  }
}
