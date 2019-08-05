// GENERATED CODE - DO NOT MODIFY BY HAND

part of checkout.api;

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$OrdersApiClient implements ApiClient {
  final String basePath = "/orders";
  Future<List<Order>> getOrdersByCustomer() async {
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
        .path("/inCustomer");
    return makeRequest(req).map(decodeList);
  }

  Future<Order> getOrder(int orderId) async {
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
        .path("/:order_id")
        .pathParams("order_id", orderId);
    return makeRequest(req).map(decodeOne);
  }

  Future<CreateOrderResponse> createOrder(
      String cartId, int shippingId, int taxId) async {
    var req = base.post
        .metadata({
          "auth": [
            {
              "type": "oauth",
              "name": "customer",
            }
          ],
        })
        .path(basePath)
        .path("/")
        .urlEncodedFormField("cartId", cartId)
        .urlEncodedFormField("shippingId", shippingId)
        .urlEncodedFormField("taxId", taxId);
    return makeRequest(req).map(decodeOne);
  }

  Future<OrderStatus> getOrderStatus(int orderId) async {
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
        .path("/shortDetail/:order_id")
        .pathParams("order_id", orderId);
    return makeRequest(req).map(decodeOne);
  }
}

abstract class _$ShippingApiClient implements ApiClient {
  final String basePath = "/shipping";
  Future<List<ShippingRegion>> getShippingRegions() async {
    var req = base.get.path(basePath).path("/regions");
    return makeRequest(req).map(decodeList);
  }

  Future<List<ShippingRegionDetail>> getShippingRegionById(
      int shippingRegionId) async {
    var req = base.get
        .path(basePath)
        .path("/regions/:shipping_region_id")
        .pathParams("shipping_region_id", shippingRegionId);
    return makeRequest(req).map(decodeList);
  }
}

abstract class _$StripeApiClient implements ApiClient {
  final String basePath = "/stripe";
  Future<void> charge(String stripeToken, int orderId, String description,
      int amount, String currency) async {
    var req = base.post
        .path(basePath)
        .path("/charge")
        .urlEncodedFormField("stripe_token", stripeToken)
        .urlEncodedFormField("order_id", orderId)
        .urlEncodedFormField("description", description)
        .urlEncodedFormField("amount", amount)
        .urlEncodedFormField("currency", currency);
    await makeRequest(req);
  }

  Future<void> webhooks() async {
    var req = base.post.path(basePath).path("/webhooks");
    await makeRequest(req);
  }
}

abstract class _$TaxApiClient implements ApiClient {
  final String basePath = "/tax";
  Future<List<TaxType>> getTaxTypes() async {
    var req = base.get.path(basePath).path("/");
    return makeRequest(req).map(decodeList);
  }

  Future<TaxType> getTaxById(int taxId) async {
    var req =
        base.get.path(basePath).path("/:tax_id").pathParams("tax_id", taxId);
    return makeRequest(req).map(decodeOne);
  }
}
