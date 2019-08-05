part of catalog.blocs;

@immutable
abstract class DepartmentsEvent extends Equatable {
  DepartmentsEvent([List props = const []]) : super(props);
}

class LoadDepartments extends DepartmentsEvent {
  final int departmentId;
  LoadDepartments({
    this.departmentId,
  });
  @override
  String toString() => 'LoadDepartments[$departmentId]';
}
