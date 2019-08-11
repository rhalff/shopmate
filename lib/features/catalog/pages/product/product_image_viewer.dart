part of catalog.pages;

class ProductImageViewer extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final ValueChanged<String> onSelect;

  ProductImageViewer({
    this.images = const [],
    @required this.onSelect,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isNotEmpty) {
      return Column(
        children: <Widget>[
          Container(
            width: 150,
            child: _renderMainImage(),
          ),
          _renderThumbs(),
        ],
      );
    }

    return const CircularProgressIndicator();
  }

  Widget _renderMainImage() {
    if (images.isNotEmpty) {
      return CachedImage(
        'https://backendapi.turing.com/images/products/${images[selectedIndex]}',
      );
    }

    return const CircularProgressIndicator();
  }

  Widget _renderThumbs() {
    final List<Widget> children = images.map((String image) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ProductImageThumb(
          image: image,
          onTap: () => onSelect(image),
          selected: image == images[selectedIndex],
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class ProductImageThumb extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  final bool selected;
  ProductImageThumb({
    @required this.image,
    @required this.onTap,
    this.selected = false,
  }) : assert(image != null);
  @override
  Widget build(BuildContext context) {
    final decoration = selected
        ? BoxDecoration(
            border: Border.all(color: Colors.red),
          )
        : null;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          decoration: decoration,
          child: CachedImage(
            'https://backendapi.turing.com/images/products/$image',
          ),
        ),
      ),
    );
  }
}
