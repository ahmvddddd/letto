import 'package:flutter/material.dart';

import 'custom_theme/custom_appbar_theme.dart';
import 'custom_theme/custom_bottom_sheet_theme.dart';
import 'custom_theme/custom_elevated_button_theme.dart';
import 'custom_theme/custom_outlined_button_theme.dart';
import 'custom_theme/custom_text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    brightness: Brightness.light,
    primaryColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    appBarTheme: CustomAppbarTheme.lightAppBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.LightElevatedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    appBarTheme: CustomAppbarTheme.darkAppBarTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
