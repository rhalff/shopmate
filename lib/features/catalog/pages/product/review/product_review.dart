part of catalog.pages;

class ProductReview extends StatelessWidget {
  final Review review;
  ProductReview({
    @required this.review,
  }) : assert(review != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Container(
          width: 160,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Ratings(rating: review.rating?.toDouble()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    review.name ?? '',
                    style: theme.textTheme.display4,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                      review.createdOn != ''
                          ? _formatDate(review.createdOn)
                          : '',
                      style: theme.textTheme.body2),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  review.review ?? '',
                  maxLines: 5,
                  style: theme.textTheme.body1,
                ),
              ),
              /* Not available in api.
              Container(
                margin: const EdgeInsets.only(top: 14.0),
                child: Row(
                  children: <Widget>[
                    IconLabel(
                      icon: Icon(Icons.favorite_border, color: Colors.pink),
                      label: '113',
                    ),
                    IconLabel(
                      icon: Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      label: '3',
                    ),
                  ],
                ),
              )
              */
            ],
          ),
        )
      ],
    );
  }

  String _formatDate(String datetime) {
    return timeago.format(DateTime.parse(datetime), locale: 'en');
  }
}

class IconLabel extends StatelessWidget {
  final Icon icon;
  final String label;
  IconLabel({
    @required this.icon,
    @required this.label,
  })  : assert(icon != null),
        assert(label != null);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        Text(label),
      ],
    );
  }
}
