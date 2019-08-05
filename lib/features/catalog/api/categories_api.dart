part of catalog.api;

@GenApiClient(path: '/categories')
class CategoriesApi extends ApiClient with _$CategoriesApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  CategoriesApi({
    this.base,
    this.converters,
  });

  /// Get Category by ID
  ///
  /// Return a category by ID.
  @GetReq(path: '/:category_id')
  Future<Category> getCategoryById(
    @PathParam('category_id') int categoryId,
  );

  /// Get Categories
  ///
  /// Return a list of categories.
  @GetReq(path: '/')
  Future<Object> getCategories(
    @QueryParam('order') String order,
    @QueryParam('page') int page,
    @QueryParam('limit') int limit,
  );

  /// Get Categories of a Department
  ///
  /// Return a list of categories from a Department ID
  @GetReq(path: '/inDepartment/:department_id')
  Future<List<Category>> getCategoriesByDepartmentId(
    @PathParam('department_id') int departmentId,
  );

  /// Get Categories of a Product
  ///
  /// Return a list of categories from a Product ID
  @GetReq(path: '/inProduct/:product_id')
  Future<List<CategoryBasic>> getProductCategories(
    @PathParam('product_id') int productId,
  );
}
