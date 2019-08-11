part of cart.api;

@GenApiClient(path: '/shoppingcart')
class ShoppingCartApi extends ApiClient with _$ShoppingCartApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  ShoppingCartApi({
    this.base,
    this.converters,
  });

  /// Add a Product in the cart
  ///
  @PostReq(path: '/add')
  Future<List<CartWithProduct>> addProduct(
    @AsFormField('cart_id') String cartId,
    @AsFormField('product_id') int productId,
    @AsFormField() String attributes,
  );

  /// Get List of Products in Shopping Cart
  ///
  ///
  @GetReq(path: '/:cart_id')
  Future<List<CartWithProduct>> getCart(
    @PathParam('cart_id') String cartId,
  );

  /// Empty cart
  ///
  ///
  @DeleteReq(path: '/empty/:cart_id')
  Future<void> emptyCart(
    @PathParam('cart_id') String cartId,
  );

  /// Generate the unique CART ID
  ///
  ///
  @GetReq(path: '/generateUniqueId')
  Future<CartId> generateUniqueId();

  /// Get Products saved for later
  ///
  ///
  @GetReq(path: '/getSaved/:cart_id')
  Future<List<Favorite>> getSaved(
    @PathParam('cart_id') String cartId,
  );

  /// Move a product to cart
  ///
  ///
  @GetReq(path: '/moveToCart/:item_id')
  Future<void> moveToCart(
    @PathParam('item_id') int itemId,
  );

  /// Remove a product in the cart
  ///
  ///
  @DeleteReq(path: '/removeProduct/:item_id')
  Future<void> removeProduct(
    @PathParam('item_id') int itemId,
  );

  /// Save a Product for later
  ///
  ///
  @GetReq(path: '/saveForLater/:item_id')
  Future<void> saveForLater(
    @PathParam('item_id') int itemId,
  );

  /// Return a total Amount from Cart
  ///
  ///
  @GetReq(path: '/totalAmount/:cart_id')
  Future<Object> getTotalAmount(
    @PathParam('cart_id') String cartId,
  );

  /// Update the cart by item
  ///
  ///
  @PutReq(path: '/update/:item_id')
  Future<List<Cart>> updateItem(
    @PathParam('item_id') int itemId,
    @AsFormField() int quantity,
  );
}
