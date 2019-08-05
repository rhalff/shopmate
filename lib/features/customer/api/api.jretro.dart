// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer.api;

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$CustomersApiClient implements ApiClient {
  final String basePath = "";
  Future<Customer> getCustomer() async {
    var req = base.get
        .metadata({
          "auth": [
            {
              "type": "oauth",
              "name": "customer",
            }
          ],
        })
        .path(basePath)
        .path("/customer");
    return makeRequest(req).map(decodeOne);
  }

  Future<Customer> updateCustomer(String name, String email, String password,
      String dayPhone, String evePhone, String mobPhone) async {
    var req = base.put
        .metadata({
          "auth": [
            {
              "type": "oauth",
              "name": "customer",
            }
          ],
        })
        .path(basePath)
        .path("/customer")
        .urlEncodedFormField("name", name)
        .urlEncodedFormField("email", email)
        .urlEncodedFormField("password", password)
        .urlEncodedFormField("day_phone", dayPhone)
        .urlEncodedFormField("eve_phone", evePhone)
        .urlEncodedFormField("mob_phone", mobPhone);
    return makeRequest(req).map(decodeOne);
  }

  Future<Customer> updateAddress(
      String address1,
      String address2,
      String city,
      String region,
      String postalCode,
      String country,
      int shippingRegionId) async {
    var req = base.put
        .metadata({
          "auth": [
            {
              "type": "oauth",
              "name": "customer",
            }
          ],
        })
        .path(basePath)
        .path("/customers/address")
        .urlEncodedFormField("address1", address1)
        .urlEncodedFormField("address2", address2)
        .urlEncodedFormField("city", city)
        .urlEncodedFormField("region", region)
        .urlEncodedFormField("postal_code", postalCode)
        .urlEncodedFormField("country", country)
        .urlEncodedFormField("shipping_region_id", shippingRegionId);
    return makeRequest(req).map(decodeOne);
  }

  Future<Customer> updateCreditCard(String creditCard) async {
    var req = base.put
        .metadata({
          "auth": [
            {
              "type": "oauth",
              "name": "customer",
            }
          ],
        })
        .path(basePath)
        .path("/customers/creditCard")
        .urlEncodedFormField("credit_card", creditCard);
    return makeRequest(req).map(decodeOne);
  }

  Future<CustomerResponse> signInWithFacebook(String accessToken) async {
    var req = base.post
        .path(basePath)
        .path("/customers/facebook")
        .urlEncodedFormField("access_token", accessToken);
    return makeRequest(req).map(decodeOne);
  }

  Future<CustomerResponse> signIn(String email, String password) async {
    var req = base.post
        .path(basePath)
        .path("/customers/login")
        .urlEncodedFormField("email", email)
        .urlEncodedFormField("password", password);
    return makeRequest(req).map(decodeOne);
  }

  Future<CustomerResponse> register(
      String name, String email, String password) async {
    var req = base.post
        .path(basePath)
        .path("/customers")
        .urlEncodedFormField("name", name)
        .urlEncodedFormField("email", email)
        .urlEncodedFormField("password", password);
    return makeRequest(req).map(decodeOne);
  }
}
