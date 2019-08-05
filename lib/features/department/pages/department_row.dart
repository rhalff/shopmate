part of department.pages;

class DepartmentRow extends StatelessWidget {
  final Product product;
  DepartmentRow({
    @required this.product,
  }) : assert(product != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Material(
            child: InkWell(
              onTap: () => _showDepartmentDetail(context, product),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      product.name,
                                      style: theme.textTheme.display2,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      product.description,
                                      style: theme.textTheme.body1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _showDepartmentDetail(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(
      CatalogScreen.route,
      arguments: {
        'product': product,
        // 'category': category,
      },
    );
  }
}
