part of department.screens;

class DepartmentScreen extends StatefulWidget {
  static const route = '/department';
  final Department department;
  DepartmentScreen({
    this.department,
  })  : assert(department != null),
        super(key: Key('${department.departmentId}'));
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  ProductsBloc _productsBloc;
  @override
  void initState() {
    _productsBloc = BlocProvider.of<ProductsBloc>(context);

    _productsBloc.dispatch(
      LoadProducts(
        departmentId: widget.department.departmentId,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShopLayout(
      body: BlocBuilder(
        bloc: _productsBloc,
        builder: (BuildContext context, ProductsState state) {
          if (state is ProductsLoaded) {
            return CatalogOverview(
              title: widget.department.name,
              description: widget.department.description,
              products: state.products,
            );
          }

          if (state is ProductsError) {
            return ErrorContainer(
              error: state.error,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
