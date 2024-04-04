import 'package:flutter/material.dart';
import 'package:my_gallery/presentation/resources/styles_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.lightBlack,
        buttonColor: ColorManager.blue),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s18),
            backgroundColor: ColorManager.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
    textTheme: TextTheme(
      headlineLarge: getBoldStyle(fontSize: FontSize.s50),
      headlineMedium: getBoldStyle(fontSize: FontSize.s30),
      headlineSmall: getRegularStyle(fontSize: FontSize.s32),
    ),
  );
}
