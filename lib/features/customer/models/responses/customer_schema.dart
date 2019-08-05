part of customer.models;

class CustomerSchema {
  final Customer schema;

  CustomerSchema({
    this.schema,
  });

  @override
  String toString() {
    return 'CustomerSchema[schema=$schema, ]';
  }
}
