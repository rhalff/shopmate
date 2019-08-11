part of department.pages;

class DepartmentList extends StatelessWidget {
  final List<Product> products;
  DepartmentList({
    @required this.products,
  }) : assert(products != null);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        final product = products[position];

        return Column(
          children: <Widget>[
            DepartmentRow(product: product),
            const Divider(height: 1),
          ],
        );
      },
      itemCount: products.length,
    );
  }
}
