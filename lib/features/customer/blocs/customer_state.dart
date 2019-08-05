part of customer.blocs;

@immutable
abstract class CustomerState extends Equatable {
  CustomerState([List props = const []]) : super(props);
}

class CustomerUninitialized extends CustomerState {
  @override
  String toString() => 'CustomerUninitialized';
}

class CustomerLoading extends CustomerState {
  @override
  String toString() => 'CustomerLoading';
}

class CustomerSigningIn extends CustomerState {
  @override
  String toString() => 'CustomerSigningIn';
}

class CustomerSigningUp extends CustomerState {
  @override
  String toString() => 'CustomerSigningUp';
}

class CustomerSigningOut extends CustomerState {
  @override
  String toString() => 'CustomerSigningOut';
}

class CustomerLoaded extends CustomerState {
  final Customer customer;

  CustomerLoaded(this.customer) : super([customer]);

  @override
  String toString() {
    return 'CustomerLoaded[customer: $customer]';
  }
}

class CustomerError extends CustomerState {
  final Error error;

  CustomerError(this.error) : super([error]);

  @override
  String toString() => 'CustomerError[error: $error]';
}
