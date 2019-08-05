part of catalog.blocs;

@immutable
abstract class FavoritesEvent extends Equatable {
  FavoritesEvent([List props = const []]) : super(props);
}

class LoadFavorites extends FavoritesEvent {
  @override
  String toString() => 'LoadFavorites';
}

class AddToFavorites extends FavoritesEvent {
  final int productId;

  AddToFavorites(this.productId)
      : assert(productId != null),
        super([productId]);

  @override
  String toString() => 'AddToFavorites[productId: $productId]';
}

class RemoveFromFavorites extends FavoritesEvent {
  final int productId;

  RemoveFromFavorites(this.productId)
      : assert(productId != null),
        super([productId]);

  @override
  String toString() => 'RemoveFromFavorites[productId: $productId]';
}

class ClearFavorites extends FavoritesEvent {
  @override
  String toString() => 'ClearFavorites';
}
