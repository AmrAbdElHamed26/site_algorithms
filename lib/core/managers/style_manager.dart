import 'package:flutter/material.dart';

import 'font_manger.dart';
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    {TextDecoration decoration = TextDecoration.none,double? letterSpacing}) {
  return TextStyle(
      fontSize: fontSize,
      letterSpacing: letterSpacing??0,
      fontFamily: FontConstants.fontFamily,
      color: color,
      decoration: decoration,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
TextStyle getUnderlineRegularStyle(
    {double fontSize = FontSize.s12, required Color color,decoration= TextDecoration.underline}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,decoration:decoration);
}


// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
TextStyle getThroghlineMeduimStyle(
    {double fontSize = FontSize.s12, required Color color,decoration= TextDecoration.lineThrough}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color,decoration:decoration);
}
// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semiBold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color,double? letterSpacing}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color,letterSpacing: letterSpacing);
}