part of checkout.api;

@GenApiClient(path: '/stripe')
class StripeApi extends ApiClient with _$StripeApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  StripeApi({
    this.base,
    this.converters,
  });

  /// This method receive a front-end payment and create a change.
  ///
  /// You can send cart information and payment token (https://stripe.com/docs/api/tokens).
  @PostReq(path: '/charge')
  Future<void> charge(
    @AsFormField('stripe_token') String stripeToken,
    @AsFormField('order_id') int orderId,
    @AsFormField() String description,
    @AsFormField() int amount,
    @AsFormField() String currency,
  );

  /// Endpoint that provide a synchronization
  ///
  /// You need put this endpoint in the stripe webhooks (https://dashboard.stripe.com/account/webhooks), so get there the end-point secrete key.
  @PostReq(path: '/webhooks')
  Future<void> webhooks();
}
