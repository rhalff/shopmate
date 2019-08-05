import 'dart:async';
import 'dart:convert';

import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class StatusInterceptor extends Interceptor {
  @override
  FutureOr after(StringResponse response) {
    print(response.toString());
    if (response.statusCode >= 500) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final String error = body['error'];

      if (error != null) {
        if (error.startsWith('TokenExpiredError')) {}
      }
    }
    return Future.value(response);
  }
}
