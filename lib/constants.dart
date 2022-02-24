import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// this for alice debugging network calls
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final logger = Logger();

//base url
const baseUrl = 'Put_base_url_here';
const headers = {'Accept': 'application/json'};
const baseImagePath = 'assets/images';

final lightTheme = ThemeData(
  primarySwatch: kPrimaryColor,
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: 'Cairo',
);

final darkTheme = ThemeData(
  primarySwatch: kPrimaryColor,
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  fontFamily: 'Cairo',
);

const Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

// styles
const MaterialColor kPrimaryColor = Colors.green;
const MaterialColor kbackgroundColor = MaterialColor(0xE5E5E5, color);
const TextStyle kTStyle = TextStyle(
  fontSize: 30,
  color: Colors.white,
);
