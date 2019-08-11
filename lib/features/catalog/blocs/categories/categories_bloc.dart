part of catalog.blocs;

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoryRepository categoryRepository;

  CategoriesBloc({
    @required this.categoryRepository,
  }) : assert(categoryRepository != null);

  @override
  CategoriesState get initialState => CategoriesLoading();

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is LoadCategories) {
      yield* _loadCategories(event);
    }
  }

  Stream<CategoriesState> _loadCategories(LoadCategories event) async* {
    try {
      yield CategoriesLoading();
      final categories = await categoryRepository.getCategories();

      yield CategoriesLoaded(categories);
    } catch (error) {
      yield CategoriesError(error);
    }
  }
}
