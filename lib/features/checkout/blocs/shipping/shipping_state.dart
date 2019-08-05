part of checkout.blocs;

@immutable
abstract class ShippingState extends Equatable {
  ShippingState([List props = const []]) : super(props);
}

class ShippingLoading extends ShippingState {
  @override
  String toString() => 'ShippingLoading';
}

class ShippingLoaded extends ShippingState {
  final List<ShippingRegion> regions;

  ShippingLoaded(this.regions) : super([regions]);

  @override
  String toString() {
    return 'ShippingLoaded[regions: $regions]';
  }
}

class ShippingError extends ShippingState {
  final Error error;

  ShippingError(this.error) : super([error]);

  @override
  String toString() => 'ShippingError[error: $error]';
}
