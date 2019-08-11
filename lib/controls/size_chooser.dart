part of controls;

class SizeChooser extends StatelessWidget {
  final List<ProductAttribute> sizes;
  final int selectedIndex;
  final ValueChanged<String> onSelect;
  SizeChooser({
    this.sizes = const [],
    this.selectedIndex = 0,
    @required this.onSelect,
  }) : assert(onSelect != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSizes(context),
        ],
      ),
    );
  }

  Row _buildSizes(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: List.generate(sizes.length, (index) {
        final color = index == selectedIndex ? Colors.pink : documentColors[4];
        final fontColor =
            index == selectedIndex ? Colors.white : Colors.black38;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => onSelect(sizes[index].value),
            child: Container(
              color: color,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.textTheme.display4.fontSize / 2,
                  vertical: 2,
                ),
                child: Text(
                  sizes[index].value,
                  style: TextStyle(
                    fontSize: theme.textTheme.display4.fontSize,
                    color: fontColor,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
