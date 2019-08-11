part of catalog.repositories;

class CategoryRepository {
  CategoriesApi categoriesApi;
  final Cache cache;

  CategoryRepository({
    this.categoriesApi,
    this.cache,
  }) : assert(categoriesApi != null);

  Future<List<Category>> getCategories() async {
    final cacheKey = 'getCategories()';

    try {
      return cache.read(cacheKey) as List<Category>;
    } catch (_) {
      final categoryResult =
          await categoriesApi.getCategories('name,ASC', 50, 30);

      cache.upsert(cacheKey, categoryResult);

      return categoryResult;
    }
  }

  Future<Category> getCategoryById(int categoryId) async {
    final cacheKey = 'getCategory($categoryId)';

    try {
      return cache.read(cacheKey) as Category;
    } catch (_) {
      final category = await categoriesApi.getCategoryById(categoryId);

      cache.upsert(cacheKey, category);

      return category;
    }
  }

  Future<List<CategoryBasic>> getProductCategories(int productId) async {
    final cacheKey = 'getProductCategories($productId)';

    try {
      return cache.read(cacheKey) as List<CategoryBasic>;
    } catch (_) {
      final categories = await categoriesApi.getProductCategories(productId);

      cache.upsert(cacheKey, categories);

      return categories;
    }
  }

  Future<List<Category>> getDepartmentCategories(int departmentId) async {
    final cacheKey = 'getDepartmentCategories($departmentId)';

    try {
      return cache.read(cacheKey) as List<Category>;
    } catch (_) {
      final categories =
          await categoriesApi.getCategoriesByDepartmentId(departmentId);

      cache.upsert(cacheKey, categories);

      return categories;
    }
  }
}
