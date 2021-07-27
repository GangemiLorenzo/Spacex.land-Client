
import 'package:flutter/material.dart';
import 'dart:ui';

ThemeData LIGHT_THEME =  ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.standard,
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.lightBlueAccent,
  focusColor: Colors.lightBlue,
  highlightColor: Colors.lightBlue,
  splashColor: Colors.lightBlue,
  toggleableActiveColor: Colors.lightBlue,
);

const TS_CARD_CONTENT = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 16,
);

const TS_CARD_TITLE = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 24,
  fontWeight: FontWeight.w500,
);