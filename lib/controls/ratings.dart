part of controls;

class Ratings extends StatelessWidget {
  final double rating;
  final int stars;
  final ValueChanged<int> onTap;
  Ratings({
    this.rating,
    this.stars = 5,
    this.onTap,
  })  : assert(rating is double),
        assert(stars is int);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildStars(),
    );
  }

  List<Widget> _buildStars() {
    final items = <Widget>[];
    List.generate(stars, (index) {
      items.add(_buildStar(index));
    });
    return items;
  }

  Widget _buildStar(int index) {
    Widget item;
    if (index < rating) {
      item = Icon(
        Icons.star,
        color: Colors.yellow,
      );
    } else {
      item = Icon(
        Icons.star_border,
      );
    }

    if (onTap != null) {
      return GestureDetector(
        child: item,
        onTap: () => onTap(index + 1),
      );
    }

    return item;
  }
}
