part of catalog.blocs;

@immutable
abstract class CategoriesEvent extends Equatable {
  CategoriesEvent([List props = const []]) : super(props);
}

class LoadCategories extends CategoriesEvent {
  @override
  String toString() => 'LoadCategories';
}
