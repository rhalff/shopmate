part of checkout.repositories;

class ShippingRegionRepository {
  ShippingApi shippingApi;
  Cache cache;
  ShippingRegionRepository({
    this.shippingApi,
    this.cache,
  }) : assert(shippingApi != null);

  Future<List<ShippingRegion>> getShippingRegions() async {
    try {
      return cache.read('shippingRegions');
    } catch (_) {
      final shippingRegions = shippingApi.getShippingRegions();

      cache.upsert('shippingRegions', shippingRegions);

      return shippingRegions;
    }
  }
}
