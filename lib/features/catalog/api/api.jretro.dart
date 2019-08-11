// GENERATED CODE - DO NOT MODIFY BY HAND

part of catalog.api;

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$AttributesApiClient implements ApiClient {
  final String basePath = "/attributes";
  Future<List<Attribute>> getAttributeById(int attributeId) async {
    var req = base.get
        .path(basePath)
        .path("/:attribute_id")
        .pathParams("attribute_id", attributeId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<Attribute>> getAttributes() async {
    var req = base.get.path(basePath).path("/");
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<ProductAttribute>> getAttributesByProductId(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/inProduct/:product_id")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<AttributeValue> getAttributeValues(int attributeId) async {
    var req = base.get
        .path(basePath)
        .path("/values/:attribute_id")
        .pathParams("attribute_id", attributeId);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}

abstract class _$CategoriesApiClient implements ApiClient {
  final String basePath = "/categories";
  Future<Category> getCategoryById(int categoryId) async {
    var req = base.get
        .path(basePath)
        .path("/:category_id")
        .pathParams("category_id", categoryId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Category>> getCategories(
      String order, int page, int limit) async {
    var req = base.get
        .path(basePath)
        .path("/")
        .query("order", order)
        .query("page", page)
        .query("limit", limit);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<Category>> getCategoriesByDepartmentId(int departmentId) async {
    var req = base.get
        .path(basePath)
        .path("/inDepartment/:department_id")
        .pathParams("department_id", departmentId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<List<CategoryBasic>> getProductCategories(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/inProduct/:product_id")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeList);
  }
}

abstract class _$DepartmentsApiClient implements ApiClient {
  final String basePath = "/departments";
  Future<Department> getDepartmentById(int departmentId) async {
    var req = base.get
        .path(basePath)
        .path("/:department_id")
        .pathParams("department_id", departmentId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Department>> getDepartments() async {
    var req = base.get.path(basePath).path("/");
    return req.go(throwOnErr: true).map(decodeList);
  }
}

abstract class _$ProductsApiClient implements ApiClient {
  final String basePath = "/products";
  Future<GetProductsResponse> getProducts(
      int page, int limit, int descriptionLength) async {
    var req = base.get
        .path(basePath)
        .path("/")
        .query("page", page)
        .query("limit", limit)
        .query("description_length", descriptionLength);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<GetProductsResponse> getProductsByCategoryId(
      int categoryId, int page, int limit, int descriptionLength) async {
    var req = base.get
        .path(basePath)
        .path("/inCategory/:category_id")
        .pathParams("category_id", categoryId)
        .query("page", page)
        .query("limit", limit)
        .query("description_length", descriptionLength);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<GetProductsResponse> getProductsByDepartmentId(
      int departmentId, int page, int limit, int descriptionLength) async {
    var req = base.get
        .path(basePath)
        .path("/inDepartment/:department_id")
        .pathParams("department_id", departmentId)
        .query("page", page)
        .query("limit", limit)
        .query("description_length", descriptionLength);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<ProductDetail>> getProductDetailsById(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/:product_id/details")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<ProductComplete> getProductById(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/:product_id")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<ProductLocations> getProductLocations(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/:product_id/locations")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Review>> getProductReviews(int productId) async {
    var req = base.get
        .path(basePath)
        .path("/:product_id/reviews")
        .pathParams("product_id", productId);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<void> createProductReview(
      int productId, String review, int rating) async {
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
        .path("/:product_id/reviews")
        .pathParams("product_id", productId)
        .urlEncodedFormField("review", review)
        .urlEncodedFormField("rating", rating);
    await req.go(throwOnErr: true);
  }

  Future<Object> searchProducts(String queryString, String allWords, int page,
      int limit, int descriptionLength) async {
    var req = base.get
        .path(basePath)
        .path("/search")
        .query("query_string", queryString)
        .query("all_words", allWords)
        .query("page", page)
        .query("limit", limit)
        .query("description_length", descriptionLength);
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
