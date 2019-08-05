import 'package:flutter/material.dart';

import 'light.dart';

ThemeData lightThemeSmall = lightTheme.copyWith(
  textTheme: lightTheme.textTheme.copyWith(
    headline: lightTheme.textTheme.headline.copyWith(
      fontSize: 64.0, // 72.0,
    ),
    subhead: lightTheme.textTheme.subhead.copyWith(
      fontSize: 56.0, // 64.0,
    ),
    title: lightTheme.textTheme.title.copyWith(
      fontSize: 40.0, // 48.0,
    ),
    subtitle: lightTheme.textTheme.subtitle.copyWith(
      fontSize: 16.0, // 24.0,
    ),
    display1: lightTheme.textTheme.display1.copyWith(
      fontSize: 41.0, // 49.0,
    ),
    display2: lightTheme.textTheme.display2.copyWith(
      fontSize: 16.0, // 24.0,
    ),
    display3: lightTheme.textTheme.display3.copyWith(
      fontSize: 8.0, // 16.0,
    ),
    display4: lightTheme.textTheme.display4.copyWith(
      fontSize: 7.0, // 15.0,
    ),
    body1: lightTheme.textTheme.body1.copyWith(
      fontSize: 8.0, // 16.0,
    ),
    body2: lightTheme.textTheme.body2.copyWith(
      fontSize: 7.0, // 15.0,
    ),
  ),
);
