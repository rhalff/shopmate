part of customer.models;

class Customer {
  final int customerId;
  final String name;
  final String email;
  final String address1;
  final String address2;
  final String city;
  final String region;
  final String postalCode;
  final String country;
  final int shippingRegionId;
  final String dayPhone;
  final String evePhone;
  final String mobPhone;
  final String creditCard;

  Customer({
    this.customerId,
    this.name,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.region,
    this.postalCode,
    this.country,
    this.shippingRegionId,
    this.dayPhone,
    this.evePhone,
    this.mobPhone,
    this.creditCard,
  });

  @override
  String toString() {
    return 'Customer[customerId=$customerId, name=$name, email=$email, address1=$address1, address2=$address2, city=$city, region=$region, postalCode=$postalCode, country=$country, shippingRegionId=$shippingRegionId, dayPhone=$dayPhone, evePhone=$evePhone, mobPhone=$mobPhone, creditCard=$creditCard, ]';
  }
}
