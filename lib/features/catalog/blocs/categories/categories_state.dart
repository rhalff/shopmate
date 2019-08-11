part of catalog.blocs;

@immutable
abstract class CategoriesState extends Equatable {
  CategoriesState([List props = const []]) : super(props);
}

class CategoriesLoading extends CategoriesState {
  @override
  String toString() => 'CategoriesLoading';
}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;

  CategoriesLoaded(this.categories) : super([categories]);

  @override
  String toString() {
    return 'CategoriesLoaded[categories: $categories]';
  }

  List<Category> byDepartmentId(int departmentId) {
    return categories
        .where((category) => category.departmentId == departmentId)
        .toList();
  }
}

class CategoriesError extends CategoriesState {
  final Object error;

  CategoriesError(this.error) : super([error]);

  @override
  String toString() => 'CategoriesError[error: $error]';
}
