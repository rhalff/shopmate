part of catalog.blocs;

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ProductRepository productRepository;

  ReviewsBloc({
    @required this.productRepository,
  }) : assert(productRepository != null);

  @override
  ReviewsState get initialState => ReviewsLoading();

  @override
  Stream<ReviewsState> mapEventToState(ReviewsEvent event) async* {
    if (event is AddReview) {
      yield* _addReview(event);
    }
    if (event is LoadReviews) {
      yield* _loadReviews(event);
    }
  }

  Stream<ReviewsState> _addReview(AddReview event) async* {
    yield ReviewsLoading();

    try {
      await productRepository.addReview(
        event.productId,
        event.review,
        event.rating,
      );

      final reviews =
          await productRepository.getProductReviews(event.productId);

      yield ReviewsLoaded(reviews);
    } catch (error) {
      print(error);
      yield ReviewsError('Failed to add review');
    }
  }

  Stream<ReviewsState> _loadReviews(LoadReviews event) async* {
    yield ReviewsLoading();

    try {
      final reviews =
          await productRepository.getProductReviews(event.productId);

      yield ReviewsLoaded(reviews);
    } catch (error) {
      print(error);
      yield ReviewsError('Failed to load reviews');
    }
  }
}
