part of catalog.blocs;

@immutable
abstract class ProductEvent extends Equatable {
  ProductEvent([List props = const []]) : super(props);
}

class LoadProduct extends ProductEvent {
  final int productId;
  LoadProduct({
    this.productId,
  });
  @override
  String toString() => 'LoadProduct[$productId]';
}
