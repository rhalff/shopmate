part of catalog.models;

class Category {
  final int categoryId;
  final String name;
  final String description;
  final int departmentId;

  Category({
    this.categoryId,
    this.name,
    this.description,
    this.departmentId,
  });

  @override
  String toString() {
    return 'Category[categoryId=$categoryId, name=$name, description=$description, departmentId=$departmentId, ]';
  }
}
