import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.blackColor,
      showSelectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
    )
  );
}