part of widgets;

class LinkItem {
  final String title;
  final String route;
  final Icon icon;
  final Map<String, dynamic> arguments;
  final VoidCallback onTap;
  final bool replace;

  const LinkItem({
    this.title,
    this.route,
    this.icon,
    this.arguments,
    this.replace = false,
    this.onTap,
  }) : assert(title != null);
}

class Link extends StatelessWidget {
  final LinkItem item;
  final TextStyle style;
  final VoidCallback onTap;
  Link(
    this.item, {
    this.style,
    this.onTap,
  }) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: item.onTap ?? onTap,
      child: Text(
        item.title,
        style: theme.textTheme.body1
            .copyWith(
              color: theme.accentColor,
              fontWeight: FontWeight.bold,
            )
            .merge(style),
      ),
    );
  }
}

class NavLink extends StatelessWidget {
  final LinkItem item;
  final TextStyle style;
  NavLink(
    this.item, {
    this.style,
  })  : assert(item != null),
        assert(item.route != null);
  @override
  Widget build(BuildContext context) {
    VoidCallback onTap;

    if (item.onTap != null) {
      onTap = item.onTap;
    } else if (item.route != null) {
      if (item.replace) {
        onTap = () => Navigator.of(context).pushReplacementNamed(
              item.route,
              arguments: item.arguments,
            );
      } else {
        onTap = () => Navigator.of(context).pushNamed(
              item.route,
              arguments: item.arguments,
            );
      }
    } else {
      throw Exception('Unable to follow link.');
    }
    return Link(
      item,
      style: style,
      onTap: onTap,
    );
  }
}
