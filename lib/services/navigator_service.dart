import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T> pushNamed<T extends Object>(String routeName, {Object arguments}) {
    return navigatorKey.currentState
        .pushNamed<T>(routeName, arguments: arguments);
  }
}
