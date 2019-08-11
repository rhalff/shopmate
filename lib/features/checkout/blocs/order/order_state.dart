part of checkout.blocs;

@immutable
abstract class OrderState extends Equatable {
  OrderState([List props = const []]) : super(props);
}

class OrderLoading extends OrderState {
  @override
  String toString() => 'OrderLoading';
}

class OrderLoaded extends OrderState {
  final Order order;

  OrderLoaded(this.order) : super([order]);

  @override
  String toString() {
    return 'OrderLoaded[order: $order]';
  }
}

class OrderError extends OrderState {
  final Object error;

  OrderError(this.error) : super([error]);

  @override
  String toString() => 'OrderError[error: $error]';
}
