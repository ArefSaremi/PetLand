import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppThemes {
  static ThemeData get defaultTheme => ThemeData(
    textTheme: textxTheme,
    elevatedButtonTheme: elevatedButtxonTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    splashFactory: NoSplash.splashFactory,
  );
}

final textxTheme = TextTheme(
  bodyLarge: TextStyle(),
  bodyMedium: TextStyle(),
).apply(bodyColor: black, displayColor: black);
final elevatedButtxonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: yellow,
    foregroundColor: black,
  ),
);
