part of catalog.repositories;

class DepartmentRepository {
  DepartmentsApi departmentsApi;
  final Cache cache;

  DepartmentRepository({
    this.departmentsApi,
    this.cache,
  }) : assert(departmentsApi != null);

  Future<List<Department>> getDepartments() async {
    final cacheKey = 'getDepartments()';

    try {
      return cache.read(cacheKey);
    } catch (_) {
      final List<Department> departmentResult =
          await departmentsApi.getDepartments();

      cache.upsert(cacheKey, departmentResult);

      return departmentResult;
    }
  }
}
