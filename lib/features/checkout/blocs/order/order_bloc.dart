part of checkout.blocs;

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({
    @required this.orderRepository,
  }) : assert(orderRepository != null);

  @override
  OrderState get initialState => OrderLoading();

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is LoadOrder) {
      yield* _loadOrder(event);
    }
  }

  Stream<OrderState> _loadOrder(LoadOrder event) async* {
    try {
      final order = await orderRepository.getOrder(event.orderId);

      yield OrderLoaded(order);
    } catch (error) {
      yield OrderError(error);
    }
  }
}
