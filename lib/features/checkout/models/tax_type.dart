part of checkout.models;

class TaxType {
  final int taxId;
  final String taxType;
  final String taxPercentage;

  TaxType({
    this.taxId,
    this.taxType,
    this.taxPercentage,
  });

  @override
  String toString() {
    return 'TaxType[taxId=$taxId, taxType=$taxType, taxPercentage=$taxPercentage, ]';
  }
}
