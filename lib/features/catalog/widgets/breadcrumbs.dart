part of catalog.widgets;

class BreadCrumbs extends StatelessWidget {
  final List<LinkItem> items;
  final Widget divider;
  final double padding;
  BreadCrumbs({
    this.items,
    this.divider = const Text('•'),
    this.padding = 5,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Widget> children = [];

    for (var i = 0; i < items.length; i++) {
      if (i > 0 && i < items.length) {
        children.add(
          Padding(
            padding: EdgeInsets.only(right: padding),
            child: divider,
          ),
        );
      }
      children.add(
        Padding(
          padding: EdgeInsets.only(right: i == items.length - 1 ? 0 : padding),
          child: NavLink(
            items[i],
            style: theme.textTheme.body1.copyWith(),
          ),
        ),
      );
    }
    return Wrap(
      children: children,
    );
  }
}
