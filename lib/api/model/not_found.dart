part of api.model;

class NotFound {
  final String message;

  NotFound({
    this.message,
  });

  @override
  String toString() {
    return 'NotFound[message=$message, ]';
  }
}
