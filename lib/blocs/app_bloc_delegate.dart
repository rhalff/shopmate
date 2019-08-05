import 'package:bloc/bloc.dart';
import 'package:errors/errors.dart';
import 'package:shopmate/errors/api_response_error_handler.dart';
import 'package:shopmate/features/auth/blocs/blocs.dart';

class AppBlocDelegate extends BlocDelegate {
  final AuthBloc authBloc;
  final appErrors = Errors();
  AppBlocDelegate({this.authBloc}) {
    appErrors.addHandler(ApiResponseErrorHandler(authBloc: authBloc));
  }
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    appErrors.onError(error, stacktrace);
    super.onError(bloc, error, stacktrace);
  }
}
