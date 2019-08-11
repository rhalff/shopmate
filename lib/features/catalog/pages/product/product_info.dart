part of catalog.pages;

class ProductInfo extends StatefulWidget {
  final FullProductDetails productDetails;
  ProductInfo({
    this.productDetails,
  }) : assert(productDetails != null);

  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  String _selectedSize = 'L';
  String _selectedColor = 'White';
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final productDetails = widget.productDetails;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (productDetails.rating != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Ratings(
              rating: productDetails.rating,
              stars: 5,
            ),
          ),
        Text(
          productDetails.product.name,
          style: theme.textTheme.display2,
        ),
        _buildPrice(context),
        ProductInfoLabel(label: 'Color'),
        ColorChooser(
          colors: productDetails.colors,
          selectedIndex: _selectedColorIndex,
          onSelect: _onSelectColor,
        ),
        ProductInfoLabel(label: 'Size'),
        SizeChooser(
          sizes: productDetails.sizes,
          selectedIndex: _selectedSizeIndex,
          onSelect: _onSelectSize,
        ),
        ProductInfoLabel(label: 'Quantity'),
        NumericStepper(
          value: _quantity,
          onChanged: _onChangedQuantity,
        ),
        const SizedBox(height: 15),
        Row(
          children: <Widget>[
            AddToCartButton(
              productId: productDetails.product.productId,
              size: _selectedSize,
              color: _selectedColor,
              quantity: _quantity,
            ),
            AddToWishList(
              productId: productDetails.product.productId,
            ),
          ],
        ),
      ],
    );
  }

  int get _selectedColorIndex {
    final index = widget.productDetails.colors
        .indexWhere((color) => color.value == _selectedColor);

    return index == -1 ? 0 : index;
  }

  int get _selectedSizeIndex {
    final index = widget.productDetails.sizes
        .indexWhere((size) => size.value == _selectedSize);

    return index == -1 ? 0 : index;
  }

  void _onChangedQuantity(int quantity) => setState(() => _quantity = quantity);
  void _onSelectSize(String size) => setState(() => _selectedSize = size);
  void _onSelectColor(String color) => setState(() => _selectedColor = color);

  Widget _buildPrice(BuildContext context) {
    final numberFormat = NumberFormat.simpleCurrency(name: 'GBP');
    final theme = Theme.of(context);
    final discountedPrice = widget.productDetails.product.discountedPrice;
    final price = widget.productDetails.product.price;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Text(
        numberFormat.format(discountedPrice > 0 ? discountedPrice : price),
        style: theme.textTheme.display2.copyWith(
          color: theme.accentColor,
        ),
      ),
    );
  }
}

class ProductInfoLabel extends StatelessWidget {
  final String label;
  ProductInfoLabel({
    this.label,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        label,
        style: theme.textTheme.display3.copyWith(
          color: TypographyColors[2],
        ),
      ),
    );
  }
}
