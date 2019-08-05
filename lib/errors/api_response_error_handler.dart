import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:shopmate/features/auth/blocs/blocs.dart';

class ApiResponseErrorHandler extends ErrorHandler<StringResponse> {
  AuthBloc authBloc;
  ApiResponseErrorHandler({this.authBloc});
  @override
  handle(StringResponse response, StackTrace stackTrace) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode >= 500) {
      final error = body['error'];
      if (error != null) {
        if (error.startsWith('TokenExpiredError')) {
          this.authBloc.dispatch(
                SignOut(),
              ); // should probably be ReAuthenticate to distinct between just a SignOut.
        }
      }
    } else {
      throw Exception('Unknown error response received from server.');
    }
  }
}
