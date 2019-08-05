part of api.model;

class ApiError {
  final String code;
  final String message;
  final String field;
  final String status;

  ApiError({
    this.code,
    this.message,
    this.field,
    this.status,
  });

  @override
  String toString() {
    return 'Error[code=$code, message=$message, field=$field, status=$status, ]';
  }
}
