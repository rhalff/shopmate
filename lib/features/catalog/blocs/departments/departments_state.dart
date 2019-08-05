part of catalog.blocs;

@immutable
abstract class DepartmentsState extends Equatable {
  DepartmentsState([List props = const []]) : super(props);
}

class DepartmentsLoading extends DepartmentsState {
  @override
  String toString() => 'DepartmentsLoading';
}

class DepartmentsLoaded extends DepartmentsState {
  final List<Department> departments;

  DepartmentsLoaded(this.departments) : super([departments]);

  @override
  String toString() {
    return 'DepartmentsLoaded[departments: $departments]';
  }
}

class DepartmentsError extends DepartmentsState {
  final Error error;

  DepartmentsError(this.error) : super([error]);

  @override
  String toString() => 'DepartmentsError[error: $error]';
}
