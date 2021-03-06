part of catalog.repositories;

class FavoritesRepository {
  static const key = 'Favorites';
  final SharedPreferences sharedPreferences;
  FavoritesRepository({
    this.sharedPreferences,
  });

  Future<List<int>> getFavorites() async {
    final favorites = sharedPreferences.getStringList(key);

    if (favorites != null) {
      return Future.value(favorites.map(int.parse).toList());
    }

    return Future.value([]);
  }

  Future<List<int>> addFavorite(int productId) async {
    final favorites = await getFavorites();

    favorites.add(productId);

    await sharedPreferences.setStringList(
        key, favorites.map((item) => item.toString()).toList());

    return favorites;
  }

  Future<List<int>> removeFavorite(int productId) async {
    final favorites = await getFavorites();

    favorites.removeWhere((item) => item == productId);

    await sharedPreferences.setStringList(
        key, favorites.map((item) => item.toString()).toList());

    return favorites;
  }

  Future<List<int>> clearFavorites() async {
    await sharedPreferences.remove(key);

    return Future.value([]);
  }
}
