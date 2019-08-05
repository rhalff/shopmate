part of catalog.models;

class ProductColor {
  final int id;
  final String value;
  final Color color;
  ProductColor({
    @required this.id,
    @required this.value,
    @required this.color,
  })  : assert(id != null),
        assert(value != null),
        assert(color != null);
}
