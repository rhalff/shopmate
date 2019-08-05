part of checkout.models;

class ShippingRegionDetail {
  final int shippingId;
  final String shippingType;
  final String shippingCost;
  final int shippingRegionId;

  ShippingRegionDetail({
    this.shippingId,
    this.shippingType,
    this.shippingCost,
    this.shippingRegionId,
  });

  @override
  String toString() {
    return 'ShippingRegionDetail[shippingId=$shippingId, shippingType=$shippingType, shippingCost=$shippingCost, shippingRegionId=$shippingRegionId, ]';
  }
}
