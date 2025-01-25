import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme : AppTheme.lightTheme,
    );
  }
}
