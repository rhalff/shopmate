part of catalog.models;

class Department {
  final int departmentId;
  final String name;
  final String description;

  Department({
    this.departmentId,
    this.name,
    this.description,
  });

  @override
  String toString() {
    return 'Department[departmentId=$departmentId, name=$name, description=$description, ]';
  }
}
