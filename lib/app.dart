import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application.dart';
import 'base_app.dart';
import 'keys/navigator.dart';
import 'localizations/nl/material_localizations.dart';
import 'routes.dart';

class ShopMateApp extends StatefulWidget {
  static const String title = 'ShopMate';
  final Application application;

  ShopMateApp({
    this.application,
  }) : assert(application != null);

  @override
  _ShopMateAppState createState() => _ShopMateAppState();
}

class _ShopMateAppState extends State<ShopMateApp> {
  @override
  void dispose() {
    widget.application.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseApp(
      title: ShopMateApp.title,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        NlMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('nl'),
      ],
      navigatorKey: navigatorKey,
      onGenerateRoute: routes(
        application: widget.application,
      ),
    );
  }
}
