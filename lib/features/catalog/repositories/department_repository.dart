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
      return cache.read(cacheKey) as List<Department>;
    } catch (_) {
      final departmentResult = await departmentsApi.getDepartments();

      cache.upsert(cacheKey, departmentResult);

      return departmentResult;
    }
  }
}
