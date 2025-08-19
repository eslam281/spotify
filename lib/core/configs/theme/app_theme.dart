import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Satoshi',
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      filled: true, fillColor: Colors.transparent,
      hintStyle: const TextStyle(color: Color(0xff383838),
      fontWeight: FontWeight.w500),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5)
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey, width: 1.5)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
      snackBarTheme:const SnackBarThemeData(backgroundColor:AppColors.grey,
          contentTextStyle:TextStyle(color:Colors.black ) )
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    inputDecorationTheme:  InputDecorationTheme(
      filled: true, fillColor: Colors.transparent,
      hintStyle: const TextStyle(color: Color(0xffA7A7A7),
          fontWeight: FontWeight.w500),
      contentPadding: const EdgeInsets.all(30),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color:Colors.grey,width: 1.5)
      ),
      enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color:Colors.grey,width: 1.5)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
      snackBarTheme:const SnackBarThemeData(backgroundColor:AppColors.grey,
          contentTextStyle:TextStyle(color:Colors.black ) )
  );
}
