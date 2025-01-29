import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  /// data that impact more than one widget
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.dark;

  /// function to change language
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }
}
