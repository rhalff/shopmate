import 'dart:async';

import 'package:jaguar_retrofit/jaguar_retrofit.dart';

import 'auth.dart';

class OAuthInterceptor extends AuthInterceptor {
  final String headerName;
  OAuthInterceptor({
    this.headerName = 'Authorization',
  });
  Map<String, String> tokens = {};

  @override
  FutureOr<void> before(RouteBase route) {
    final authInfo = getAuthInfo(route, 'oauth');
    for (var info in authInfo) {
      final token = tokens[info['name']];
      if (token != null) {
        route.header(headerName, 'Bearer $token');
        break;
      }
    }
    super.before(route);
  }

  @override
  FutureOr after(StringResponse response) {
    return Future.value(response);
  }
}
