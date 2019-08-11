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
  @override
  void initState() {
    super.initState();

    _productsBloc = BlocProvider.of<ProductsBloc>(context)
      ..dispatch(LoadProducts());
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
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
