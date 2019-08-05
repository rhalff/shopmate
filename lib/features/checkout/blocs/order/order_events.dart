part of checkout.blocs;

@immutable
abstract class OrderEvent extends Equatable {
  OrderEvent([List props = const []]) : super(props);
}

class LoadOrder extends OrderEvent {
  final int orderId;
  LoadOrder({
    this.orderId,
  }) : assert(orderId != null);
  @override
  String toString() => 'LoadOrder';
}
