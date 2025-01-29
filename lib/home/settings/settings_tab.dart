import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/language_bottom_sheet.dart';
import 'package:islami/home/settings/theme_bottom_sheet.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ShowModalBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryColor
                    : AppColors.primaryDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: provider.appTheme == ThemeMode.light
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 20)
                        : Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ShowThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.light
                    ? AppColors.primaryColor
                    : AppColors.primaryDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Text(
                    provider.appTheme == ThemeMode.dark
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: provider.appTheme == ThemeMode.light
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 20)
                        : Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 20, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: provider.appTheme == ThemeMode.light
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
