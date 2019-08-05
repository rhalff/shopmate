part of customer.api;

@GenApiClient()
class CustomersApi extends ApiClient with _$CustomersApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  CustomersApi({
    this.base,
    this.converters,
  });

  /// Get a customer by ID. The customer is getting by Token.
  ///
  ///
  @GetReq(
    path: '/customer',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<Customer> getCustomer();

  /// Update a customer
  ///
  ///
  @PutReq(path: '/customer', metadata: {
    'auth': [
      {
        'type': 'oauth',
        'name': 'customer',
      }
    ]
  })
  Future<Customer> updateCustomer(
    @AsFormField() String name,
    @AsFormField() String email,
    @AsFormField() String password,
    @AsFormField('day_phone') String dayPhone,
    @AsFormField('eve_phone') String evePhone,
    @AsFormField('mob_phone') String mobPhone,
  );

  /// Update the address from customer
  ///
  ///
  @PutReq(path: '/customers/address', metadata: {
    'auth': [
      {
        'type': 'oauth',
        'name': 'customer',
      }
    ]
  })
  Future<Customer> updateAddress(
    @AsFormField() String address1,
    @AsFormField() String address2,
    @AsFormField() String city,
    @AsFormField() String region,
    @AsFormField('postal_code') String postalCode,
    @AsFormField() String country,
    @AsFormField('shipping_region_id') int shippingRegionId,
  );

  /// Update the credit card from customer
  ///
  ///
  @PutReq(
    path: '/customers/creditCard',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<Customer> updateCreditCard(
    @AsFormField('credit_card') String creditCard,
  );

  /// Sign in with a facebook login token.
  ///
  /// Customer Login with Facebook.
  @PostReq(path: '/customers/facebook')
  Future<CustomerResponse> signInWithFacebook(
    @AsFormField('access_token') String accessToken,
  );

  /// Sign in in the Shopping.
  ///
  /// Customer Login.
  @PostReq(path: '/customers/login')
  Future<CustomerResponse> signIn(
    @AsFormField() String email,
    @AsFormField() String password,
  );

  /// Register a Customer
  ///
  /// Record a customer.
  @PostReq(path: '/customers')
  Future<CustomerResponse> register(
    @AsFormField() String name,
    @AsFormField() String email,
    @AsFormField() String password,
  );
}
