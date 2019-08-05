part of api.model;

class Unauthorized {
  final String code;
  final String message;
  final String field;

  Unauthorized({
    this.code,
    this.message,
    this.field,
  });

  @override
  String toString() {
    return 'Unauthorized[code=$code, message=$message, field=$field, ]';
  }
}
