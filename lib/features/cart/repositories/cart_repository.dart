part of cart.repositories;

class CartRepository {
  List<CartWithProduct> _currentCart;
  ShoppingCartApi shoppingCartApi;
  String cartId;
  TaxApi taxApi;
  CartRepository({
    @required this.shoppingCartApi,
    @required this.taxApi,
  })  : assert(shoppingCartApi != null),
        assert(taxApi != null);

  Future<List<CartWithProduct>> getShoppingCart() async {
    if (_currentCart == null) {
      final sharedPreferences = await SharedPreferences.getInstance();

      cartId = sharedPreferences.getString('cartId');

      if (cartId == null) {
        final result = await shoppingCartApi.generateUniqueId();

        cartId = result.cartId;

        await sharedPreferences.setString('cartId', cartId);
      }
    }

    await _refreshCart(cartId);

    return _currentCart;
  }

  Future<void> _refreshCart(String id) async {
    _currentCart = await shoppingCartApi.getCart(id);
  }

  Future<List<CartWithProduct>> addProduct(
    int productId,
    String size,
    String color,
    int quantity,
  ) async {
    assert(productId != null);
    assert(size != null);
    assert(quantity != null);

    if (_currentCart == null) {
      await getShoppingCart();
    }

    final attributes = [size, color].join(', ');

    _currentCart = await shoppingCartApi.addProduct(
      cartId,
      productId,
      attributes,
    );

    if (quantity > 1) {
      final lastItem = _currentCart.singleWhere((item) =>
          item.productId == productId && item.attributes == attributes);

      await shoppingCartApi.updateItem(lastItem.itemId, quantity);

      await _refreshCart(cartId);
    }

    return _currentCart;
  }

  Future<List<CartWithProduct>> increaseProductItem(
    int itemId,
  ) async {
    final item = _currentCart.singleWhere((item) => item.itemId == itemId);
    return updateProductItem(itemId, item.quantity + 1);
  }

  Future<List<CartWithProduct>> decreaseProductItem(
    int itemId,
  ) async {
    final item = _currentCart.singleWhere((item) => item.itemId == itemId);
    return updateProductItem(itemId, item.quantity - 1);
  }

  Future<List<CartWithProduct>> updateProductItem(
    int itemId,
    int quantity,
  ) async {
    await shoppingCartApi.updateItem(itemId, quantity);
    await _refreshCart(cartId);

    return _currentCart;
  }

  Future<List<CartWithProduct>> removeProductItem(int itemId) async {
    await shoppingCartApi.removeProduct(itemId);
    await _refreshCart(cartId);

    return _currentCart;
  }

  Future<List<CartWithProduct>> emptyCart() async {
    await shoppingCartApi.emptyCart(cartId);

    return _currentCart = [];
  }

  Future<List<Favorite>> addToFavorites(int productId) async {
    await shoppingCartApi.saveForLater(productId);

    return getFavorites();
  }

  Future<List<Favorite>> getFavorites() async {
    if (cartId = null) {
      return <Favorite>[];
    }

    return shoppingCartApi.getSaved(cartId);
  }

  Future<List<TaxType>> getTaxTypes() async {
    if (cartId = null) {
      return <TaxType>[];
    }

    return taxApi.getTaxTypes();
  }
}
