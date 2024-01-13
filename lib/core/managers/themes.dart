import 'package:algorithms_site/core/managers/color_manager.dart';
import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:ColorManager.scaffoldBackgroundColor,
  appBarTheme:  AppBarTheme(
    color:ColorManager.primaryLightColor,
  ),
  primaryColor: ColorManager.primaryLightColor,
);