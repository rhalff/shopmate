part of checkout.blocs;

@immutable
abstract class ShippingEvent extends Equatable {
  ShippingEvent([List props = const []]) : super(props);
}

class LoadShipping extends ShippingEvent {
  @override
  String toString() => 'LoadShipping';
}
