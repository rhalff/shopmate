part of checkout.api;

@GenApiClient(path: '/tax')
class TaxApi extends ApiClient with _$TaxApiClient {
  final Route base;
  final Map<String, CodecRepo> converters;

  TaxApi({
    this.base,
    this.converters,
  });

  /// Get All Tax types
  ///
  /// Return a list of tax types.
  @GetReq(path: '/')
  Future<List<TaxType>> getTaxTypes();

  /// Get Tax by ID
  ///
  /// Return a tax by ID.
  @GetReq(path: '/:tax_id')
  Future<TaxType> getTaxById(
    @PathParam('tax_id') int taxId,
  );
}
