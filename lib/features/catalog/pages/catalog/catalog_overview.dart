part of catalog.pages;

enum CatalogViewType { listView, gridView }

class CatalogOverview extends StatefulWidget {
  final List<Product> products;
  final String title;
  final String description;
  CatalogOverview({
    this.title,
    this.description,
    this.products,
  }) : assert(products != null);

  @override
  _CatalogOverviewState createState() => _CatalogOverviewState();
}

class _CatalogOverviewState extends State<CatalogOverview>
    with DeviceInfoMixin<CatalogOverview> {
  CatalogViewType _viewType = CatalogViewType.listView;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: isLargeScreen
                ? EdgeInsets.only(
                    top: 15,
                    left: 30,
                    right: 30,
                  )
                : EdgeInsets.only(
                    left: 2,
                    right: 2,
                  ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey,
                width: 0.3,
              )),
            ),
            child: Column(
              children: <Widget>[
                _buildOverviewHeader(context),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: isLargeScreen
                  ? EdgeInsets.only(
                      left: 30,
                      right: 30,
                    )
                  : EdgeInsets.only(
                      left: 3,
                      right: 3,
                    ),
              child: _buildCatalogView(),
            ),
          ),
        ],
      ),
    );
  }

  _buildCatalogView() {
    if (_viewType == CatalogViewType.listView) {
      return ProductList(
        products: widget.products,
        onScroll: _onScroll,
      );
    }

    return ProductGrid(
      products: widget.products,
      onScroll: _onScroll,
    );
  }

  double _headerMaxHeight = 50;
  double _headerHeight = 50;

  _onScroll(ScrollController controller) {
    setState(() {
      var offset = controller.offset;

      if (_headerHeight > 0 && offset < _headerMaxHeight) {
        _headerHeight = _headerMaxHeight - offset;
      }
    });
  }

  _buildOverviewHeader(BuildContext context) {
    final theme = Theme.of(context);
    final opacity = _headerHeight / _headerMaxHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (widget.title != null)
              Text(
                widget.title,
                style: theme.textTheme.subtitle,
              ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.list),
                  onPressed: _toggleView,
                  color: _viewType == CatalogViewType.listView
                      ? theme.accentColor
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.grid_on),
                  onPressed: _toggleView,
                  color: _viewType == CatalogViewType.gridView
                      ? theme.accentColor
                      : null,
                ),
              ],
            )
          ],
        ),
        if (widget.description != null)
          Container(
            padding: EdgeInsets.only(top: 15),
            color: Colors.white10.withOpacity(opacity),
            height: _headerHeight,
            child: Text(
              widget.description,
              style: theme.textTheme.body1,
              softWrap: true,
            ),
          )
      ],
    );
  }

  _toggleView() {
    setState(() {
      _headerHeight = _headerMaxHeight;
      _viewType = _viewType == CatalogViewType.listView
          ? CatalogViewType.gridView
          : CatalogViewType.listView;
    });
  }
}
