part of checkout.models;

class ShippingRegion {
  final int shippingRegionId;
  final String shippingRegion;

  ShippingRegion({
    this.shippingRegionId,
    this.shippingRegion,
  });

  @override
  String toString() {
    return 'ShippingRegion[shippingRegionId=$shippingRegionId, shippingRegion=$shippingRegion, ]';
  }
}
