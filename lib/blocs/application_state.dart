import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ApplicationState extends Equatable {
  ApplicationState([List props = const []]) : super(props);
}

class NotApplicationenticated extends ApplicationState {
  @override
  String toString() => 'NotApplicationenticated';
}

class Applicationenticated extends ApplicationState {
  @override
  String toString() {
    return 'Applicationenticated[]';
  }
}

class ApplicationError extends ApplicationState {
  final Error error;

  ApplicationError(this.error) : super([error]);

  @override
  String toString() => 'ApplicationError[error: $error]';
}
