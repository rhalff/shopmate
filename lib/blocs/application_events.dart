import 'package:meta/meta.dart';

@immutable
abstract class ApplicationEvent {}

class SignedIn extends ApplicationEvent {
  final String accessToken;
  SignedIn({
    this.accessToken,
  });
}

class SignOut extends ApplicationEvent {}
