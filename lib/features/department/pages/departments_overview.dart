part of department.pages;

class DepartmentsOverview extends StatelessWidget {
  final List<Product> products;
  DepartmentsOverview({
    this.products,
  }) : assert(products != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Men Shirts & Tops', style: theme.textTheme.subtitle),
          const SizedBox(height: 8),
          const Divider(height: 15),
          Expanded(
            child: DepartmentList(
              products: products,
            ),
          ),
        ],
      ),
    );
  }
}
