part of catalog.screens;

class CatalogScreen extends StatefulWidget {
  static const route = '/catalog/overview';
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Category> categories = [];
  List<Product> products = [];
  ProductsBloc _productsBloc;
  DepartmentsBloc _departmentsBloc;
  @override
  void initState() {
    super.initState();

    _departmentsBloc = BlocProvider.of<DepartmentsBloc>(context);

    _productsBloc = BlocProvider.of<ProductsBloc>(context);

    _productsBloc.dispatch(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return ShopLayout(
      body: BlocBuilder(
        bloc: _productsBloc,
        builder: (BuildContext context, ProductsState state) {
          if (state is ProductsLoaded) {
            return CatalogOverview(
              products: state.products,
            );
          }

          if (state is ProductsError) {
            return ErrorContainer(
              error: state.error,
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildLinkItems() {
    return BlocBuilder(
      bloc: _departmentsBloc,
      // File issue to add @required, so it's filled automatically.
      builder: (
        BuildContext context,
        DepartmentsState state,
      ) {
        if (state is DepartmentsLoaded) {
          final items = <LinkItem>[
            LinkItem(
              title: 'Home',
              route: '/',
            ),
          ];

          items.addAll(
            state.departments.map(
              (department) {
                return LinkItem(
                  title: department.name,
                  route: '/categories/${department.name}',
                );
              },
            ),
          );

          return BreadCrumbs(
            items: items,
          );
        }

        return Container();
      },
    );
  }
}
