part of catalog.models;

class CategoryBasic {
  final int categoryId;
  final int departmentId;
  final String name;

  CategoryBasic({
    this.categoryId,
    this.departmentId,
    this.name,
  });

  @override
  String toString() {
    return 'CategoryBasic[categoryId=$categoryId, departmentId=$departmentId, name=$name, ]';
  }
}
