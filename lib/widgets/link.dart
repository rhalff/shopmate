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
      onTap: this.item.onTap ?? onTap,
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

    if (this.item.onTap != null) {
      onTap = this.item.onTap;
    } else if (this.item.route != null) {
      if (this.item.replace) {
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
