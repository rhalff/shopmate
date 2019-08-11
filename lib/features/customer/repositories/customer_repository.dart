part of customer.repositories;

class CustomerRepository {
  final Cache cache;
  static const key = 'accessToken';
  static const cacheKey = 'Customer';
  final CustomersApi customersApi;
  final TuringApi turingApi;
  final FlutterSecureStorage secureStorage;

  CustomerRepository({
    @required this.turingApi,
    @required this.customersApi,
    @required this.cache,
    @required this.secureStorage,
  })  : assert(turingApi != null),
        assert(customersApi != null),
        assert(cache != null),
        assert(secureStorage != null);

  Future<Customer> getCustomer() async {
    final cacheKey = 'getCustomer()';

    try {
      return cache.read(cacheKey) as Customer;
    } catch (_) {
      final customer = await customersApi.getCustomer();

      cache.upsert(cacheKey, customer);

      return customer;
    }
  }

  Future<Customer> updateCustomer(
    String name,
    String email,
    String password,
    String dayPhone,
    String evePhone,
    String mobPhone,
  ) async {
    final customer = await customersApi.updateCustomer(
      name,
      email,
      password,
      dayPhone,
      evePhone,
      mobPhone,
    );

    cache.upsert(cacheKey, customer);

    return customer;
  }

  Future<Customer> updateAddress(
    String address1,
    String address2,
    String city,
    String region,
    String postalCode,
    String country,
    int shippingRegionId,
  ) async {
    final customer = await customersApi.updateAddress(
      address1,
      address2,
      city,
      region,
      postalCode,
      country,
      shippingRegionId,
    );

    cache.upsert(cacheKey, customer);

    return customer;
  }

  Future<Customer> updateCreditCard(
    String creditCard,
  ) async {
    final customer = await customersApi.getCustomer();

    cache.upsert(cacheKey, customer);

    return customer;
  }

  Future<CustomerResponse> signIn(
    String email,
    String password,
  ) async {
    return customersApi.signIn(email, password);
  }

  Future<CustomerResponse> signUp(
    String email,
    String password,
    String name,
  ) async {
    return customersApi.register(name, email, password);
  }
}
