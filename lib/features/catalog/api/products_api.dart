part of catalog.api;

@GenApiClient(path: '/products')
class ProductsApi extends ApiClient with _$ProductsApiClient {
  @override
  final Route base;

  final Map<String, CodecRepo> converters;

  ProductsApi({
    this.base,
    this.converters,
  });

  /// Get All Products
  ///
  /// Return a list of products.
  @GetReq(path: '/')
  Future<GetProductsResponse> getProducts(
    @QueryParam('page') int page,
    @QueryParam('limit') int limit,
    @QueryParam('description_length') int descriptionLength,
  );

  /// Get a list of Products of Categories
  ///
  ///
  @GetReq(path: '/inCategory/:category_id')
  Future<GetProductsResponse> getProductsByCategoryId(
    @PathParam('category_id') int categoryId,
    @QueryParam('page') int page,
    @QueryParam('limit') int limit,
    @QueryParam('description_length') int descriptionLength,
  );

  /// Get a list of Products on Department
  ///
  ///
  @GetReq(path: '/inDepartment/:department_id')
  Future<GetProductsResponse> getProductsByDepartmentId(
    @PathParam('department_id') int departmentId,
    @QueryParam('page') int page,
    @QueryParam('limit') int limit,
    @QueryParam('description_length') int descriptionLength,
  );

  /// Get details of a Product
  ///
  ///
  @GetReq(path: '/:product_id/details')
  // Future<ProductDetail> productsProductIdDetailsGet(
  // Somehow returns a list?
  Future<List<ProductDetail>> getProductDetailsById(
    @PathParam('product_id') int productId,
  );

  /// Product by ID
  ///
  ///
  @GetReq(path: '/:product_id')
  Future<ProductComplete> getProductById(
    @PathParam('product_id') int productId,
  );

  /// Get locations of a Product
  ///
  ///
  @GetReq(path: '/:product_id/locations')
  Future<ProductLocations> getProductLocations(
    @PathParam('product_id') int productId,
  );

  /// Get reviews of a Product
  ///
  ///
  @GetReq(path: '/:product_id/reviews')
  Future<List<Review>> getProductReviews(
    @PathParam('product_id') int productId,
  );

  ///
  ///
  ///
  @PostReq(
    path: '/:product_id/reviews',
    metadata: {
      'auth': [
        {
          'type': 'oauth',
          'name': 'customer',
        }
      ],
    },
  )
  Future<void> createProductReview(
    @PathParam('product_id') int productId,
    @AsFormField() String review,
    @AsFormField() int rating,
  );

  /// Search products
  ///
  ///
  @GetReq(path: '/search')
  Future<Object> searchProducts(
    @QueryParam('query_string') String queryString,
    @QueryParam('all_words') String allWords,
    @QueryParam('page') int page,
    @QueryParam('limit') int limit,
    @QueryParam('description_length') int descriptionLength,
  );
}
