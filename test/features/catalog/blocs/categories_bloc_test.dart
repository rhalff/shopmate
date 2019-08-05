import 'package:shopmate/features/catalog/blocs/blocs.dart';
import 'package:test_api/test_api.dart';

void main() {
  CategoriesBloc categoriesBloc;

  setUp(() {
    categoriesBloc = CategoriesBloc(
      categoryRepository:
    );
  });

  group('CategoriesTest', () {
    test('Initial state is CategoriesLoading', () {
      expect(categoriesBloc.currentState, isA<CategoriesLoading>());
    });
  });
}
