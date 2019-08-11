import 'dart:async';

import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class LogInterceptor extends Interceptor {
  @override
  FutureOr<void> before(RouteBase route) {
    print('URL: ${route.getUrl}');
    super.before(route);
  }

  @override
  FutureOr after(StringResponse response) {
    print(response.toString());
    return Future.value(response);
  }
}
