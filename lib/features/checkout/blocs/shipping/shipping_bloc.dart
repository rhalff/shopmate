part of checkout.blocs;

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  final ShippingRegionRepository shippingRegionRepository;

  ShippingBloc({
    @required this.shippingRegionRepository,
  }) : assert(shippingRegionRepository != null);

  @override
  ShippingState get initialState => ShippingLoading();

  @override
  Stream<ShippingState> mapEventToState(ShippingEvent event) async* {
    if (event is LoadShipping) {
      yield* _loadShipping();
    }
  }

  Stream<ShippingState> _loadShipping() async* {
    try {
      final shipping = await shippingRegionRepository.getShippingRegions();

      yield ShippingLoaded(shipping);
    } catch (error) {
      yield ShippingError(error);
    }
  }
}
