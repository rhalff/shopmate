part of catalog.blocs;

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  final DepartmentRepository departmentRepository;

  DepartmentsBloc({
    @required this.departmentRepository,
  }) : assert(departmentRepository != null);

  @override
  DepartmentsState get initialState => DepartmentsLoading();

  @override
  Stream<DepartmentsState> mapEventToState(DepartmentsEvent event) async* {
    if (event is LoadDepartments) {
      yield* _loadDepartments(event);
    }
  }

  Stream<DepartmentsState> _loadDepartments(LoadDepartments event) async* {
    try {
      yield DepartmentsLoading();
      final List<Department> departments =
          await this.departmentRepository.getDepartments();

      yield DepartmentsLoaded(departments);
    } catch (error) {
      yield DepartmentsError(error);
    }
  }
}
