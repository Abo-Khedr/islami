import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home/hadeth/hadeth_details.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/home/quran/sura_details.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      theme: AppTheme.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(provider.appLanguage),
    );
  }
}
