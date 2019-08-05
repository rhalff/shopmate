part of catalog.blocs;

@immutable
abstract class ReviewsState extends Equatable {
  ReviewsState([List props = const []]) : super(props);
}

class ReviewsLoading extends ReviewsState {
  @override
  String toString() => 'ReviewsLoading';
}

class ReviewsLoaded extends ReviewsState {
  final List<Review> reviews;

  ReviewsLoaded(this.reviews) : super([reviews]);

  @override
  String toString() {
    return 'ReviewsLoaded[reviews: $reviews]';
  }
}

class ReviewsError extends ReviewsState {
  final String error;

  ReviewsError(this.error) : super([error]);

  @override
  String toString() => 'ReviewsError[error: $error]';
}
