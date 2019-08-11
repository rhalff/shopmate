part of checkout.repositories;

// Can I make the CachedRepository generic?
// Seems not so simple, because how to cache can be pretty specific.

class TaxRepository {
  TaxApi taxApi;
  Cache cache;
  TaxRepository({
    this.taxApi,
    this.cache,
  });

  Future<List<TaxType>> getTaxTypes() async {
    try {
      return cache.read('taxTypes') as List<TaxType>;
    } catch (_) {
      final taxTypes = taxApi.getTaxTypes();

      cache.upsert('taxtTypes', taxTypes);

      return taxTypes;
    }
  }
}
