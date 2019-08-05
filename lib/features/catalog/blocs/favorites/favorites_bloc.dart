part of catalog.blocs;

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository favoritesRepository;

  FavoritesBloc({
    @required this.favoritesRepository,
  }) : assert(favoritesRepository != null);

  @override
  FavoritesState get initialState => FavoritesLoading();

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is LoadFavorites) {
      yield* _loadFavorites();
    } else if (event is AddToFavorites) {
      yield* _addToFavorites(event);
    } else if (event is RemoveFromFavorites) {
      yield* _removeFromFavorites(event);
    } else if (event is ClearFavorites) {
      yield* clearFavorites();
    }
  }

  Stream<FavoritesState> _loadFavorites() async* {
    try {
      final List<int> favorites = await this.favoritesRepository.getFavorites();

      yield FavoritesLoaded(favorites);
    } catch (error) {
      yield FavoritesError(error);
    }
  }

  Stream<FavoritesState> _addToFavorites(AddToFavorites event) async* {
    if (currentState is FavoritesLoaded) {
      final List<int> updatedFavorites =
          await favoritesRepository.addFavorite(event.productId);

      yield FavoritesLoaded(updatedFavorites);
    }
  }

  Stream<FavoritesState> _removeFromFavorites(
      RemoveFromFavorites event) async* {
    if (currentState is FavoritesLoaded) {
      final List<int> updatedFavorites =
          await favoritesRepository.removeFavorite(event.productId);

      yield FavoritesLoaded(updatedFavorites);
    }
  }

  Stream<FavoritesState> clearFavorites() async* {
    if (currentState is FavoritesLoaded) {
      final List<int> updatedFavorites =
          await favoritesRepository.clearFavorites();
      yield FavoritesLoaded(updatedFavorites);
    }
  }
}
