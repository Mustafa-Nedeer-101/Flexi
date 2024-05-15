import 'package:flexi/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:flexi/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flexi/utils/theme/custom_themes/check_box_theme.dart';
import 'package:flexi/utils/theme/custom_themes/chip_theme.dart';
import 'package:flexi/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flexi/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flexi/utils/theme/custom_themes/text_form_field_theme.dart';
import 'package:flexi/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class CustomAppTheme {
  CustomAppTheme._();

  // theme for light mode
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Anta",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    // Custom Themes
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedbuttonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    textTheme: TTextTheme.lightTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  // theme for dark mode
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Anta",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    // Custom Themes
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedbuttonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    textTheme: TTextTheme.darkTextTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
