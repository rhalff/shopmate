import 'dart:async';

import 'package:jaguar_retrofit/jaguar_retrofit.dart';

import 'auth.dart';

class ApiKeyAuthInterceptor extends AuthInterceptor {
  Map<String, String> apiKeys = {};

  @override
  FutureOr<void> before(RouteBase route) {
    final authInfo = getAuthInfo(route, 'apiKey');
    for (var info in authInfo) {
      final authName = info['name'] as String;
      final authKeyName = info['keyName'] as String;
      final authWhere = info['where'] as String;
      final apiKey = apiKeys[authName];
      if (apiKey != null) {
        if (authWhere == 'query') {
          route.query(authKeyName, apiKey);
        } else {
          route.header(authKeyName, apiKey);
        }
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
