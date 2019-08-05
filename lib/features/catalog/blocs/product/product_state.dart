part of catalog.blocs;

@immutable
abstract class ProductState extends Equatable {
  ProductState([List props = const []]) : super(props);
}

class ProductLoading extends ProductState {
  @override
  String toString() => 'ProductLoading';
}

class ProductLoaded extends ProductState {
  final FullProductDetails productDetails;

  ProductLoaded(this.productDetails) : super([productDetails]);

  @override
  String toString() {
    return 'ProductLoaded[productDetails: $productDetails]';
  }
}

class ProductError extends ProductState {
  final Error error;

  ProductError(this.error) : super([error]);

  @override
  String toString() => 'ProductError[error: $error]';
}
