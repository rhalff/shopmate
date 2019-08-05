part of catalog.blocs;

@immutable
abstract class ReviewsEvent extends Equatable {
  ReviewsEvent([List props = const []]) : super(props);
}

class LoadReviews extends ReviewsEvent {
  final int productId;
  LoadReviews({
    this.productId,
  });
  @override
  String toString() => 'LoadReviews[productId: $productId]';
}

class AddReview extends ReviewsEvent {
  final int productId;
  final String name;
  final String review;
  final int rating;
  AddReview({
    this.productId,
    this.name,
    this.review,
    this.rating,
  });
  @override
  String toString() =>
      'AddReview[productId: $productId, review: $review, rating: $rating]';
}
