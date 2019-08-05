part of catalog.pages;

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({
    @required this.products,
  }) : assert(products != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        final product = products[position];

        return Column(
          children: <Widget>[
            SizedBox(height: 8),
            ProductRow(product: product),
            SizedBox(height: 8),
            Divider(height: 1),
          ],
        );
      },
      itemCount: products.length,
    );
  }
}
