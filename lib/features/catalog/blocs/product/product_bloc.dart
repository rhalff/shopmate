part of catalog.blocs;

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  final ReviewsBloc reviewsBloc;
  StreamSubscription<ReviewsState> _reviewsBlocSubscription;

  ProductBloc({
    @required this.productRepository,
    @required this.reviewsBloc,
  }) {
    assert(productRepository != null);
    assert(reviewsBloc != null);
    _reviewsBlocSubscription = reviewsBloc.state.listen((state) {
      if (state is ReviewsLoaded && currentState is ProductLoaded) {
        final productId =
            (currentState as ProductLoaded).productDetails.product.productId;

        dispatch(LoadProduct(productId: productId));
      }
    });
  }

  @override
  ProductState get initialState => ProductLoading();

  @override
  void dispose() {
    _reviewsBlocSubscription.cancel();
    super.dispose();
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProduct) {
      yield* _loadProduct(event);
    }
  }

  Stream<ProductState> _loadProduct(LoadProduct event) async* {
    try {
      yield ProductLoading();
      final FullProductDetails productDetails =
          await this.productRepository.getFullProductDetails(event.productId);

      yield ProductLoaded(productDetails);
    } catch (error) {
      yield ProductError(error);
    }
  }
}
