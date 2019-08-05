import 'package:bloc/bloc.dart';

class MiddlewareDelegate extends BlocDelegate {
  final List<BlocDelegate> delegates;

  MiddlewareDelegate({
    this.delegates = const [],
  });

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);

    delegates.forEach((delegate) {
      delegate.onEvent(bloc, event);
    });
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    delegates.forEach((delegate) {
      delegate.onTransition(bloc, transition);
    });
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);

    delegates.forEach((delegate) {
      delegate.onError(bloc, error, stacktrace);
    });
  }
}
