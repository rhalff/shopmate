part of catalog.pages;

class ProductGrid extends StatefulWidget {
  final List<Product> products;
  final Function(ScrollController) onScroll;
  ProductGrid({
    @required this.products,
    this.onScroll,
  }) : assert(products != null);

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
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
    return GridView.builder(
      controller: controller,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 270,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, position) {
        final product = widget.products[position];

        return ProductCard(product: product);
      },
      itemCount: widget.products.length,
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({
    this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        child: InkWell(
          onTap: () => _showProductDetail(context, product),
          child: Container(
            decoration: BoxDecoration(
              /*
              border: Border.all(
                color: Color(0XFF979797),
              ),
              */
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  CachedImage(
                    'https://backendapi.turing.com/images/products/${product.thumbnail}',
                  ),
                  const SizedBox(height: 15),
                  Header3(product.name),
                  const SizedBox(height: 15),
                  PriceColumn(product: product),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showProductDetail(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(ProductScreen.route, arguments: {
      'product': product,
    });
  }
}
