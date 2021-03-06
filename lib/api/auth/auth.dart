import 'package:jaguar_retrofit/jaguar_retrofit.dart';

abstract class AuthInterceptor extends Interceptor {
  /*
     * Get auth information on given route for the given type
     * Can return null if type is not present on auth data or if route doesn't need authentication
     */
  List<dynamic> getAuthInfo(RouteBase route, String type) {
    if (route.metadataMap.containsKey('auth')) {
      final auth = route.metadataMap['auth'];
      final results = [];
      for (var info in auth) {
        if (info['type'] == type) {
          results.add(info);
        }
      }
      return results;
    }
    return [];
  }
}
