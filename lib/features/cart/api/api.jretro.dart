// GENERATED CODE - DO NOT MODIFY BY HAND

part of cart.api;

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ShoppingCartApiClient implements ApiClient {
  final String basePath = "/shoppingcart";
  Future<List<CartWithProduct>> addProduct(
      String cartId, int productId, String attributes) async {
    var req = base.post
        .path(basePath)
        .path("/add")
        .urlEncodedFormField("cart_id", cartId)
        .urlEncodedFormField("product_id", productId)
        .urlEncodedFormField("attributes", attributes);
    return makeRequest(req).map(decodeList);
  }

  Future<List<CartWithProduct>> getCart(String cartId) async {
    var req =
        base.get.path(basePath).path("/:cart_id").pathParams("cart_id", cartId);
    return makeRequest(req).map(decodeList);
  }

  Future<void> emptyCart(String cartId) async {
    var req = base.delete
        .path(basePath)
        .path("/empty/:cart_id")
        .pathParams("cart_id", cartId);
    await makeRequest(req);
  }

  Future<CartId> generateUniqueId() async {
    var req = base.get.path(basePath).path("/generateUniqueId");
    return makeRequest(req).map(decodeOne);
  }

  Future<Object> getSaved(String cartId) async {
    var req = base.get
        .path(basePath)
        .path("/getSaved/:cart_id")
        .pathParams("cart_id", cartId);
    return makeRequest(req).map(decodeOne);
  }

  Future<void> moveToCart(int itemId) async {
    var req = base.get
        .path(basePath)
        .path("/moveToCart/:item_id")
        .pathParams("item_id", itemId);
    await makeRequest(req);
  }

  Future<void> removeProduct(int itemId) async {
    var req = base.delete
        .path(basePath)
        .path("/removeProduct/:item_id")
        .pathParams("item_id", itemId);
    await makeRequest(req);
  }

  Future<void> saveForLater(int itemId) async {
    var req = base.get
        .path(basePath)
        .path("/saveForLater/:item_id")
        .pathParams("item_id", itemId);
    await makeRequest(req);
  }

  Future<Object> getTotalAmount(String cartId) async {
    var req = base.get
        .path(basePath)
        .path("/totalAmount/:cart_id")
        .pathParams("cart_id", cartId);
    return makeRequest(req).map(decodeOne);
  }

  Future<List<Cart>> updateItem(int itemId, int quantity) async {
    var req = base.put
        .path(basePath)
        .path("/update/:item_id")
        .pathParams("item_id", itemId)
        .urlEncodedFormField("quantity", quantity);
    return makeRequest(req).map(decodeList);
  }
}
