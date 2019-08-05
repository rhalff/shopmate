part of catalog.api;

@GenApiClient(path: '/departments')
class DepartmentsApi extends ApiClient with _$DepartmentsApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  DepartmentsApi({
    this.base,
    this.converters,
  });

  /// Get Department by ID
  ///
  /// Return a department by ID.
  @GetReq(path: '/:department_id')
  Future<Department> getDepartmentById(
    @PathParam('department_id') int departmentId,
  );

  /// Get Departments
  ///
  /// Return a list of department.
  @GetReq(path: '/')
  Future<List<Department>> getDepartments();
}
