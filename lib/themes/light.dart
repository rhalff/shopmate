import 'package:flutter/material.dart';

const typographyColors = [
  Color(0xFF2E2E2E),
  Color(0xFF6C6C6C),
  Color(0xFFB4B4B4),
  Color(0xFFF62F5E),
  Colors.white,
];

const documentColors = [
  Color(0xFF2E2E2E),
  Color(0xFFF62F5E),
  Color(0xFF6EB2FB),
  Color(0xFF1AD3D),
  Color(0xFFF7F7F7),
  Color(0xFF00D3CA),
  Color(0xFFEFFC90),
  Color(0xFFEFEFEF),
];

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue[800],
  accentColor: documentColors[1],
  fontFamily: 'OpenSans',
  backgroundColor: Colors.pink,
  canvasColor: documentColors[4],
  primarySwatch: Colors.teal,
  textTheme: TextTheme(
    //
    headline: TextStyle(
      fontSize: 72.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    //
    subhead: TextStyle(
      fontSize: 64.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    //
    title: TextStyle(
      fontSize: 48.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    //
    subtitle: TextStyle(
      fontSize: 24.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    // H1
    display1: TextStyle(
      fontSize: 48.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    // H2
    display2: TextStyle(
      fontSize: 24.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    // H3
    display3: TextStyle(
      fontSize: 16.0,
      fontFamily: 'PlayfairDisplay',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    // Topbar
    display4: TextStyle(
      fontSize: 15.0,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.bold,
      color: typographyColors[0],
    ),

    // Body Normal
    body1: TextStyle(
      fontSize: 16.0,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: typographyColors[1],
    ),

    // Body Small
    body2: TextStyle(
      fontSize: 12.0,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      color: typographyColors[1],
    ),

    // button: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // caption: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // display4: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // overline: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
