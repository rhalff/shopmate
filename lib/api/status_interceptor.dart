import 'dart:async';
import 'dart:convert';

import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class StatusInterceptor extends Interceptor {
  @override
  FutureOr after(StringResponse response) {
    print(response.toString());
    if (response.statusCode >= 500) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final error = body['error'] as String;

      if (error != null) {
        if (error.startsWith('TokenExpiredError')) {}
      }
    }
    return Future.value(response);
  }
}
