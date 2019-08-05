import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shopmate/themes/themes.dart';

const TextStyle _errorTextStyle = TextStyle(
  color: Color(0xD0FF0000),
  fontFamily: 'monospace',
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
  decorationColor: Color(0xFFFFFF00),
  decorationStyle: TextDecorationStyle.double,
  debugLabel: 'fallback style; consider putting your text in a Material',
);

enum ThemeMode {
  system,
  light,
  dark,
}

class BaseApp extends StatefulWidget {
  const BaseApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
  })  : assert(routes != null),
        assert(navigatorObservers != null),
        assert(title != null),
        assert(debugShowMaterialGrid != null),
        assert(showPerformanceOverlay != null),
        assert(checkerboardRasterCacheImages != null),
        assert(checkerboardOffscreenLayers != null),
        assert(showSemanticsDebugger != null),
        assert(debugShowCheckedModeBanner != null),
        super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  final Widget home;

  final Map<String, WidgetBuilder> routes;

  final String initialRoute;

  final RouteFactory onGenerateRoute;

  final RouteFactory onUnknownRoute;

  final List<NavigatorObserver> navigatorObservers;

  final TransitionBuilder builder;

  final String title;

  final GenerateAppTitle onGenerateTitle;

  final ThemeData theme;

  final ThemeData darkTheme;

  final ThemeMode themeMode;

  final Color color;

  final Locale locale;

  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;

  final LocaleListResolutionCallback localeListResolutionCallback;

  final LocaleResolutionCallback localeResolutionCallback;

  final Iterable<Locale> supportedLocales;

  final bool showPerformanceOverlay;

  final bool checkerboardRasterCacheImages;

  final bool checkerboardOffscreenLayers;

  final bool showSemanticsDebugger;

  final bool debugShowCheckedModeBanner;

  final bool debugShowMaterialGrid;

  @override
  _BaseAppState createState() => _BaseAppState();
}

class _MaterialScrollBehavior extends ScrollBehavior {
  @override
  TargetPlatform getPlatform(BuildContext context) {
    return Theme.of(context).platform;
  }

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // When modifying this function, consider modifying the implementation in
    // the base class as well.
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
    }
    return null;
  }
}

class _BaseAppState extends State<BaseApp> {
  HeroController _heroController;

  @override
  void initState() {
    super.initState();
    _heroController = HeroController(createRectTween: _createRectTween);
    _updateNavigator();
  }

  @override
  void didUpdateWidget(BaseApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.navigatorKey != oldWidget.navigatorKey) {
      // If the Navigator changes, we have to create a new observer, because the
      // old Navigator won't be disposed (and thus won't unregister with its
      // observers) until after the new one has been created (because the
      // Navigator has a GlobalKey).
      _heroController = HeroController(createRectTween: _createRectTween);
    }
    _updateNavigator();
  }

  List<NavigatorObserver> _navigatorObservers;

  void _updateNavigator() {
    if (widget.home != null ||
        widget.routes.isNotEmpty ||
        widget.onGenerateRoute != null ||
        widget.onUnknownRoute != null) {
      _navigatorObservers =
          List<NavigatorObserver>.from(widget.navigatorObservers)
            ..add(_heroController);
    } else {
      _navigatorObservers = const <NavigatorObserver>[];
    }
  }

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates sync* {
    if (widget.localizationsDelegates != null)
      yield* widget.localizationsDelegates;
    yield DefaultMaterialLocalizations.delegate;
    yield DefaultCupertinoLocalizations.delegate;
  }

  @override
  Widget build(BuildContext context) {
    Widget result = WidgetsApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: _navigatorObservers,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) =>
          MaterialPageRoute<T>(settings: settings, builder: builder),
      home: widget.home,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onUnknownRoute: widget.onUnknownRoute,
      builder: (BuildContext context, Widget child) {
        final isLargeScreen = MediaQuery.of(context).size.width > 600;

        final theme = isLargeScreen ? lightTheme : lightThemeSmall;

        // Use a light theme, dark theme, or fallback theme.
        /*
        final ThemeMode mode = widget.themeMode ?? ThemeMode.system;
        ThemeData theme;
        if (widget.darkTheme != null) {
          final ui.Brightness platformBrightness =
              MediaQuery.platformBrightnessOf(context);
          if (mode == ThemeMode.dark ||
              (mode == ThemeMode.system &&
                  platformBrightness == ui.Brightness.dark)) {
            theme = widget.darkTheme;
          }
        }
        theme ??= widget.theme ?? ThemeData.fallback();
        */

        return AnimatedTheme(
          data: theme,
          isMaterialAppTheme: true,
          child: widget.builder != null
              ? Builder(
                  builder: (BuildContext context) {
                    return widget.builder(context, child);
                  },
                )
              : child,
        );
      },
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      textStyle: _errorTextStyle,
      color: widget.color ?? widget.theme?.primaryColor ?? Colors.blue,
      locale: widget.locale,
      localizationsDelegates: _localizationsDelegates,
      localeResolutionCallback: widget.localeResolutionCallback,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      inspectorSelectButtonBuilder:
          (BuildContext context, VoidCallback onPressed) {
        return FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: onPressed,
          mini: true,
        );
      },
    );

    assert(() {
      if (widget.debugShowMaterialGrid) {
        result = GridPaper(
          color: const Color(0xE0F9BBE0),
          interval: 8.0,
          divisions: 2,
          subdivisions: 1,
          child: result,
        );
      }
      return true;
    }());

    return ScrollConfiguration(
      behavior: _MaterialScrollBehavior(),
      child: result,
    );
  }
}
