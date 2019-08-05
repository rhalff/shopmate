part of checkout.pages;

class DeliveryFormData {
  @NotEmpty(
    message: 'First Name must be specified.',
  )
  @Size(
    min: 1,
    max: 255,
    message: r'Name cannot exceed $max characters.',
  )
  String firstName;

  @NotEmpty(
    message: 'Last name must be specified.',
  )
  @Size(
    min: 1,
    max: 255,
    message: r'Last name cannot exceed $max characters.',
  )
  String lastName;

  @NotEmpty(
    message: 'Address must be specified.',
  )
  String address;

  @NotEmpty(
    message: 'City must be specified.',
  )
  String city;

  @NotEmpty(
    message: 'State must be specified.',
  )
  String state;

  @NotEmpty(
    message: 'ZipCode must be specified.',
  )
  String zipCode;

  String country = 'Great Britain';
  ShippingType shipping = ShippingType.standard;
}

@GenValidator()
class DeliveryFormDataValidator extends Validator<DeliveryFormData>
    with _$DeliveryFormDataValidator {}
