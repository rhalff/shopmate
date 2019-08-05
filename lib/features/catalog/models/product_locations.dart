part of catalog.models;

class ProductLocations {
  final int categoryId;
  final String categoryName;
  final int departmentId;
  final String departmentName;

  ProductLocations({
    this.categoryId,
    this.categoryName,
    this.departmentId,
    this.departmentName,
  });

  @override
  String toString() {
    return 'ProductLocations[categoryId=$categoryId, categoryName=$categoryName, departmentId=$departmentId, departmentName=$departmentName, ]';
  }
}
