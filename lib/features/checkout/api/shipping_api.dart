part of checkout.api;

@GenApiClient(path: '/shipping')
class ShippingApi extends ApiClient with _$ShippingApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  ShippingApi({
    this.base,
    this.converters,
  });

  /// Get shipping regions
  ///
  ///
  @GetReq(path: '/regions')
  Future<List<ShippingRegion>> getShippingRegions();

  /// Get shipping region
  ///
  ///
  @GetReq(path: '/regions/:shipping_region_id')
  Future<List<ShippingRegionDetail>> getShippingRegionById(
    @PathParam('shipping_region_id') int shippingRegionId,
  );
}
