part of catalog.models;

class GetProductsResponse {
  final int count;
  final List<Product> rows;
  GetProductsResponse({
    this.count,
    this.rows,
  });
}
