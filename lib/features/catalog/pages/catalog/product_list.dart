part of catalog.pages;

class ProductList extends StatefulWidget {
  final List<Product> products;
  final Function(ScrollController) onScroll;
  ProductList({
    @required this.products,
    this.onScroll,
  }) : assert(products != null);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_onScroll);
  }

  void _onScroll() {
    widget?.onScroll(controller);
  }

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (context, position) {
        final product = widget.products[position];

        return FadeIn(
          position / 2,
          Hero(
            tag: 'product-${product.productId}',
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8),
                ProductRow(product: product),
                const SizedBox(height: 8),
                const Divider(height: 1),
              ],
            ),
          ),
        );
      },
      itemCount: widget.products.length,
    );
  }
}
