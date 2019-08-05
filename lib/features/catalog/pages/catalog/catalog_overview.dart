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
      /*
      padding: EdgeInsets.only(
        top: 15,
        left: 30,
        right: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
      ),
      */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            // distinct if small device.
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
                SizedBox(height: 25),
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
      );
    }

    return ProductGrid(
      products: widget.products,
    );
  }

  _buildOverviewHeader(BuildContext context) {
    final theme = Theme.of(context);

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
        SizedBox(height: 15),
        if (widget.description != null)
          Text(
            widget.description,
            style: theme.textTheme.body1,
            softWrap: true,
          ),
      ],
    );
  }

  _toggleView() {
    setState(() {
      _viewType = _viewType == CatalogViewType.listView
          ? CatalogViewType.gridView
          : CatalogViewType.listView;
    });
  }
}
