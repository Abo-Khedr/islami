import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash Screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? AppColors.whiteColor
          : AppColors.blueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            provider.appTheme == ThemeMode.light
                ? Image.asset(
                    "assets/images/logo2.png",
                    width: 262,
                    height: 262,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/images/dark_logo.png",
                    width: 262,
                    height: 262,
                    fit: BoxFit.cover,
                  ),
          ],
        ),
      ),
    );
  }
}
