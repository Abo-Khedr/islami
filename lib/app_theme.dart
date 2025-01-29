import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColorLight: AppColors.primaryColor,
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
      titleMedium: GoogleFonts.elMessiri(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.inter(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w400
      ),
      bodySmall: GoogleFonts.inter(
          color: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w400
      ),
    )
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColorLight: AppColors.primaryDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.blueColor,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryDarkColor,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
      unselectedLabelStyle: TextStyle(
        backgroundColor: AppColors.whiteColor,
        color: AppColors.whiteColor,
      ),
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryDarkColor
      ),
      showSelectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.elMessiri(
          color: AppColors.whiteColor,
          fontSize: 30,
          fontWeight: FontWeight.bold
      ),
      titleMedium: GoogleFonts.elMessiri(
          color: AppColors.whiteColor,
          fontSize: 25,
          fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.inter(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w400
      ),
      bodySmall: GoogleFonts.inter(
          color: AppColors.primaryDarkColor,
          fontSize: 20,
          fontWeight: FontWeight.w400
      ),
    )
  );
}