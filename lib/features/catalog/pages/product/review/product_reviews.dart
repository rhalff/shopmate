part of catalog.pages;

class ProductReviews extends StatelessWidget {
  final List<Review> reviews;
  final int productId;
  ProductReviews({
    this.productId,
    this.reviews = const [],
  }) : assert(productId != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (reviews.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Product reviews',
                style: theme.textTheme.display2,
              ),
            ),
          _buildReviews(),
          ProductReviewForm(
            productId: productId,
          ),
        ],
      ),
    );
  }

  Widget _buildReviews() {
    final children = <Widget>[];
    for (var i = 0; i < reviews.length; i++) {
      final review = reviews[i];

      if (review.review.isNotEmpty) {
        children.addAll([
          ProductReview(
            review: review,
          ),
          const Divider(),
        ]);
      }
    }

    return Column(
      children: children,
    );
  }
}
