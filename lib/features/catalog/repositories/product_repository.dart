part of catalog.repositories;

class ProductRepository {
  final ProductsApi productsApi;
  final AttributesApi attributesApi;
  final Cache cache;

  ProductRepository({
    this.productsApi,
    this.attributesApi,
    this.cache,
  }) : assert(productsApi != null);

  Future<List<Product>> getProducts({
    int page = 1,
    int limit = 50,
    int descriptionLength = 30,
  }) async {
    final cacheKey = 'getProducts($page,$limit,$descriptionLength)';

    try {
      return cache.read(cacheKey) as List<Product>;
    } catch (_) {
      final productResult =
          await productsApi.getProducts(page, limit, descriptionLength);

      cache.upsert(cacheKey, productResult.rows);

      return productResult.rows;
    }
  }

  Future<List<Product>> getProductsByDepartmentId({
    int departmentId,
    int page = 1,
    int limit = 50,
    int descriptionLength = 30,
  }) async {
    assert(departmentId != null);
    final cacheKey =
        'getProductsByDepartmentId($departmentId,$page,$limit,$descriptionLength)';

    try {
      return cache.read(cacheKey) as List<Product>;
    } catch (_) {
      final productResult = await productsApi.getProductsByDepartmentId(
        departmentId,
        page,
        limit,
        descriptionLength,
      );

      cache.upsert(cacheKey, productResult.rows);

      final products = productResult.rows
          .map((product) => getFullProductDetails(product.productId));

      await Future.wait(products);

      return productResult.rows;
    }
  }

  Future<List<Product>> getProductsByCategoryId({
    int categoryId,
    int page = 1,
    int limit = 50,
    int descriptionLength = 30,
  }) async {
    assert(categoryId != null);
    final cacheKey =
        'getProductsByCategoryId($categoryId,$page,$limit,$descriptionLength)';

    try {
      return cache.read(cacheKey) as List<Product>;
    } catch (_) {
      final productResult = await productsApi.getProductsByCategoryId(
        categoryId,
        page,
        limit,
        descriptionLength,
      );

      cache.upsert(cacheKey, productResult.rows);

      return productResult.rows;
    }
  }

  Future<List<Review>> getProductReviews(int productId) async {
    return productsApi.getProductReviews(productId);
  }

  Future<void> addReview(int productId, String review, int rating) async {
    await productsApi.createProductReview(productId, review, rating);

    cache.remove('getFullProductDetails($productId)');
  }

  Future<FullProductDetails> getFullProductDetails(int productId) async {
    assert(productId != null);

    final cacheKey = 'getFullProductDetails($productId)';

    try {
      return cache.read(cacheKey) as FullProductDetails;
    } catch (_) {
      final product = await productsApi.getProductDetailsById(productId);

      final reviews = await productsApi.getProductReviews(productId);

      final attributes =
          await attributesApi.getAttributesByProductId(productId);

      final fullProductDetails = FullProductDetails(
        product: product.first,
        reviews: reviews,
        attributes: attributes,
      );

      cache.upsert(cacheKey, fullProductDetails);

      return fullProductDetails;
    }
  }
}
