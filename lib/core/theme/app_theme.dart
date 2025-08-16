import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static final ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Satoshi',
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
    ))
  );
  static final ThemeData darkTheme= ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
    ))
  );
}