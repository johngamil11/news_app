import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app_colors.dart';

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.green,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.green,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70) , bottomRight: Radius.circular(70) )
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
        fontWeight: FontWeight.bold,
        fontSize: 22,
          color: AppColors.white
      ),titleMedium: GoogleFonts.exo(
        fontSize: 14,
          color: AppColors.white
      )
    )
  );

}