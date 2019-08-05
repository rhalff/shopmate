part of customer.models;

class CustomerResponse {
  final Customer customer;
  final String accessToken;

  @Alias('expires_in')
  final String expiresIn;

  CustomerResponse({
    this.customer,
    this.accessToken,
    this.expiresIn,
  });
  @override
  String toString() {
    return 'CustomerResponse[customer=$customer, accessToken=$accessToken, expiresIn=$expiresIn, ]';
  }
}
