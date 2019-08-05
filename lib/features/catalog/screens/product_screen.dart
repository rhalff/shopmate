part of catalog.screens;

class ProductScreen extends StatefulWidget {
  static const route = '/catalog/product/details';

  final Product product;
  ProductScreen({
    @required this.product,
  }) : assert(product != null);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductBloc _productBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _productBloc = BlocProvider.of<ProductBloc>(context);

    _productBloc.dispatch(LoadProduct(productId: widget.product.productId));
  }

  @override
  Widget build(BuildContext context) {
    return ShopLayout(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: BlocBuilder(
                bloc: _productBloc,
                builder: (BuildContext context, ProductState state) {
                  if (state is ProductLoaded) {
                    return _buildProductPage(state.productDetails);
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  _buildProductPage(FullProductDetails productDetails) {
    return Column(
      children: <Widget>[
        ProductDetails(
          key: Key('${productDetails.product.productId}'),
          productDetails: productDetails,
        ),
        ProductReviews(
          productId: productDetails.product.productId,
          reviews: productDetails.reviews,
        ),
      ],
    );
  }
}
