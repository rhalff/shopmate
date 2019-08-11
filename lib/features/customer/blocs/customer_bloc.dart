part of customer.blocs;

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  final AuthBloc authBloc;
  StreamSubscription _authBlocSubscription;

  CustomerBloc({
    @required this.customerRepository,
    @required this.authBloc,
  }) {
    assert(customerRepository != null);
    assert(authBloc != null);

    _authBlocSubscription = authBloc.state.listen((state) {
      if (state is SignOut) {
        dispatch(ClearCustomerData());
      }
    });
  }

  @override
  void dispose() {
    _authBlocSubscription.cancel();
    super.dispose();
  }

  @override
  CustomerState get initialState => CustomerUninitialized();

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is LoadCustomer) {
      yield* _loadCustomer(event);
    } else if (event is SignIn) {
      yield* _signIn(event);
    } else if (event is SignUp) {
      yield* _signUp(event);
    } else if (event is ClearCustomerData) {
      yield* _clearCustomerData();
    } else if (event is UpdateCustomer) {
      yield* _updateCustomer(event);
    } else if (event is UpdateAddress) {
      yield* _updateAddress(event);
    } else if (event is UpdateCreditCard) {
      yield* _updateCreditCard(event);
    }
  }

  Stream<CustomerState> _loadCustomer(LoadCustomer event) async* {
    yield CustomerLoading();
    final customer = await customerRepository.getCustomer();

    yield CustomerLoaded(customer);
  }

  Stream<CustomerState> _updateCustomer(UpdateCustomer event) async* {
    try {
      yield CustomerLoading();
      final customer = await customerRepository.updateCustomer(
        event.profile.name,
        event.profile.email,
        event.profile.password,
        event.profile.dayPhone,
        event.profile.evePhone,
        event.profile.mobPhone,
      );

      yield CustomerLoaded(customer);
    } catch (error) {
      yield CustomerError(_parseError(error));
    }
  }

  Stream<CustomerState> _updateAddress(UpdateAddress event) async* {
    try {
      yield CustomerLoading();
      final customer = await customerRepository.updateAddress(
        event.address.address1,
        event.address.address2,
        event.address.city,
        event.address.region,
        event.address.postalCode,
        event.address.country,
        event.address.shippingRegionId,
      );

      yield CustomerLoaded(customer);
    } catch (error) {
      yield CustomerError(_parseError(error));
    }
  }

  Stream<CustomerState> _updateCreditCard(UpdateCreditCard event) async* {
    try {
      yield CustomerLoading();
      final customer =
          await customerRepository.updateCreditCard(event.creditCard);

      yield CustomerLoaded(customer);
    } catch (error) {
      yield CustomerError(_parseError(error));
    }
  }

  Stream<CustomerState> _signIn(SignIn event) async* {
    try {
      yield CustomerSigningIn();
      final response = await customerRepository.signIn(
        event.email,
        event.password,
      );

      authBloc.dispatch(SignedIn(accessToken: response.accessToken));

      yield CustomerLoaded(response.customer);
    } catch (error) {
      yield CustomerError(_parseError(error));
    }
  }

  String _parseError(Object error) {
    if (error is StringResponse) {
      final body = jsonDecode(error.body) as Map<String, dynamic>;

      if (body['error'] != null && body['error']['message'] != null) {
        return body['error']['message'] as String;
      }
    }

    return error.toString();
  }

  Stream<CustomerState> _signUp(SignUp event) async* {
    try {
      yield CustomerSigningUp();

      final response = await customerRepository.signUp(
        event.email,
        event.password,
        event.name,
      );

      authBloc.dispatch(SignedIn(accessToken: response.accessToken));

      yield CustomerLoaded(response.customer);
    } catch (error) {
      yield CustomerError(_parseError(error));
    }
  }

  Stream<CustomerState> _clearCustomerData() async* {
    yield CustomerUninitialized();
  }
}
