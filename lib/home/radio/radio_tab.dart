import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          Image.asset(
            "assets/images/radio_logo.png",
            width: 412,
            height: 222,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
          ),
          Text(
            AppLocalizations.of(context)!.holy_quran_radio,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.skip_next,
                color: provider.appTheme == ThemeMode.light ?
                AppColors.primaryColor :
                AppColors.primaryDarkColor,
                size: 50,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.play_arrow,
                color: provider.appTheme == ThemeMode.light ?
                AppColors.primaryColor :
                AppColors.primaryDarkColor,
                size: 50,
              ),
              SizedBox(
                width: 25,
              ),
              Icon(
                Icons.skip_next,
                color: provider.appTheme == ThemeMode.light ?
                AppColors.primaryColor :
                AppColors.primaryDarkColor,
                size: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
