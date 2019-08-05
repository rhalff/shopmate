part of catalog.blocs;

@immutable
abstract class FavoritesState extends Equatable {
  FavoritesState([List props = const []]) : super(props);
}

class FavoritesLoading extends FavoritesState {
  @override
  String toString() => 'FavoritesLoading';
}

class FavoritesLoaded extends FavoritesState {
  final List<int> favorites;

  FavoritesLoaded(this.favorites) : super([favorites]);

  bool isFavorite(int productId) {
    return favorites.indexWhere((int element) => element == productId) >= 0;
  }

  @override
  String toString() {
    return 'FavoritesLoaded[favorites: $favorites]';
  }
}

class FavoritesError extends FavoritesState {
  final Error error;

  FavoritesError(this.error) : super([error]);

  @override
  String toString() => 'FavoritesError[error: $error]';
}
