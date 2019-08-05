part of checkout.models;

@GenValidator(fields: {
  /* Not support yet, a List of ProductAttribute
  'attributes': [
    Valid(),
  ],
  */
  'productName': [
    Size(
      min: 2,
      max: 255,
      message: r'Product Name must be between $min and $max characters.',
    ),
  ],
  'quantity': [
    Min(
      value: 1,
      message: 'Quantity must at least be 1',
    ),
  ]
})
class OrderValidator extends Validator<Order> with _$OrderValidator {}

final checkoutValidators = <Validator>[
  OrderValidator(),
];
