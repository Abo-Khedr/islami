import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ShowThemeBottomSheet extends StatefulWidget {
  const ShowThemeBottomSheet({super.key});

  @override
  State<ShowThemeBottomSheet> createState() => _ShowThemeBottomSheetState();
}

class _ShowThemeBottomSheetState extends State<ShowThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: provider.appTheme==ThemeMode.light ? AppColors.whiteColor : AppColors.blueColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },

                /// english
                child: provider.appTheme==ThemeMode.dark
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.dark)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.dark)),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.light);
                },
                child: provider.appTheme==ThemeMode.light
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.light)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.light)),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
        Spacer(),
        Icon(
          Icons.check,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}
