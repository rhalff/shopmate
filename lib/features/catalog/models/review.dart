part of catalog.models;

class Review {
  final String name;
  final String review;
  final int rating;
  final String createdOn;

  Review({
    this.name,
    this.review,
    this.rating,
    this.createdOn,
  });

  @override
  String toString() {
    return 'Review[name=$name, review=$review, rating=$rating, createdOn=$createdOn, ]';
  }
}
