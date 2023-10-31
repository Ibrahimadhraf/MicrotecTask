import 'package:flutter/material.dart';
import 'package:microtectask/core/utils/color_constant.dart';
import 'package:microtectask/core/utils/consts.dart';

final appTheme = ThemeData(
    fontFamily: montserratArabic,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
    ),
    scaffoldBackgroundColor: backGround,
    progressIndicatorTheme:
    const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: white,
    ),
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(color: primaryColor),
        iconColor: white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: white),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(8),
        )));