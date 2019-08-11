part of catalog.pages;

class ProductActions extends StatefulWidget {
  final Product product;
  ProductActions({
    this.product,
  })  : assert(product != null),
        super(key: Key('ProductActions${product.productId.toString()}'));

  @override
  _ProductActionsState createState() => _ProductActionsState();
}

class _ProductActionsState extends State<ProductActions> {
  ProductAttribute _selectedSize;
  ProductBloc _productBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _productBloc = BlocProvider.of<ProductBloc>(context)
      ..dispatch(LoadProduct(productId: widget.product.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _productBloc,
        builder: (BuildContext context, ProductState state) {
          if (state is ProductLoaded) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildSizesDropDown(state.productDetails.sizes),
                    AddToCartButton(
                      productId: widget.product.productId,
                      color: state.productDetails.sizes.first.value,
                      size: _selectedSize?.value,
                      quantity: 1,
                    )
                  ],
                ),
                AddToWishList(productId: widget.product.productId),
              ],
            );
          }

          return Center(child: const CircularProgressIndicator());
        });
  }

  Widget _buildSizesDropDown(List<ProductAttribute> sizes) {
    return SizesDropDown(
      sizes: sizes,
      value: _selectedSize?.value,
      onChanged: _onChangedSize,
    );
  }

  void _onChangedSize(ProductAttribute newValue) {
    setState(() {
      _selectedSize = newValue;
    });
  }
}
