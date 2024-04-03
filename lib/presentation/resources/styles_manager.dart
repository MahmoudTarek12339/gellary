import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/resources/color_manager.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: ColorManager.lightBlack,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.regular);
}

// bold style

TextStyle getBoldtStyle({double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.bold);
}
