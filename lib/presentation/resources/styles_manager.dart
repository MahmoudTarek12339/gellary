import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/resources/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, Color color = ColorManager.lightBlack}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, Color color = ColorManager.lightBlack}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}
