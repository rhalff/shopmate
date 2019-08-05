part of customer.blocs;

@immutable
abstract class CustomerEvent {}

class LoadCustomer extends CustomerEvent {
  @override
  String toString() => 'LoadCustomer';
}

class UpdateCustomer extends CustomerEvent {
  final Profile profile;

  UpdateCustomer(this.profile);
}

class UpdateAddress extends CustomerEvent {
  final Address address;
  UpdateAddress(this.address);
}

class UpdateCreditCard extends CustomerEvent {
  final String creditCard;
  UpdateCreditCard({this.creditCard});
}

class SignIn extends CustomerEvent {
  final String email;
  final String password;
  SignIn({
    this.email,
    this.password,
  });
}

class SignUp extends CustomerEvent {
  final String name;
  final String email;
  final String password;
  SignUp({
    this.name,
    this.email,
    this.password,
  });
}

class ClearCustomerData extends CustomerEvent {}
