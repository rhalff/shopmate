part of catalog.pages;

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  ProductGrid({
    @required this.products,
  }) : assert(products != null);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 270,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, position) {
        final product = products[position];

        return ProductCard(product: product);
      },
      itemCount: products.length,
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
              border: Border.all(
                color: Color(0XFF979797),
              ),
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
                  SizedBox(height: 15),
                  CachedImage(
                    'https://backendapi.turing.com/images/products/${product.thumbnail}',
                  ),
                  SizedBox(height: 15),
                  Header3(product.name),
                  SizedBox(height: 15),
                  PriceColumn(product: product),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showProductDetail(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(ProductScreen.route, arguments: {
      'product': product,
    });
  }
}
