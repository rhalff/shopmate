import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:shopmate/features/auth/blocs/blocs.dart';

class ApiResponseErrorHandler extends ErrorHandler<StringResponse> {
  AuthBloc authBloc;
  ApiResponseErrorHandler({this.authBloc});
  @override
  void handle(StringResponse exception, StackTrace stackTrace) {
    final body = jsonDecode(exception.body) as Map<String, dynamic>;

    if (exception.statusCode >= 500) {
      final error = body['error'];
      if (error != null) {
        if (error.startsWith('TokenExpiredError') == true) {
          authBloc.dispatch(
            SignOut(),
          ); // should probably be ReAuthenticate to distinct between just a SignOut.
        }
      }
    } else {
      throw Exception('Unknown error response received from server.');
    }
  }
}
