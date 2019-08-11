part of catalog.pages;

class ProductDetails extends StatefulWidget {
  final FullProductDetails productDetails;
  ProductDetails({
    Key key,
    this.productDetails,
  })  : assert(productDetails != null),
        super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String _selectedImage;

  @override
  void initState() {
    super.initState();

    _selectedImage = widget.productDetails.product.image;
  }

  @override
  Widget build(BuildContext context) {
    final productDetails = widget.productDetails;
    return Container(
      padding: const EdgeInsets.only(top: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 0.3,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (productDetails != null)
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: ProductImageViewer(
                  images: productDetails.product.images,
                  onSelect: _selectImage,
                  selectedIndex: _selectedIndex(productDetails.product.images),
                ),
              ),
            ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (productDetails != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: ProductInfo(
                        productDetails: productDetails,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _selectedIndex(List<String> images) {
    return images.indexOf(_selectedImage);
  }

  void _selectImage(String image) {
    setState(() {
      _selectedImage = image;
    });
  }
}
