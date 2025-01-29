import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({super.key});

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
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
                  provider.changeLanguage('en');
                },

                /// english
                child: provider.appLanguage == 'en'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.english)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.english)),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: provider.appLanguage == 'ar'
                    ? getSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)
                    : getUnSelectedItemWidget(
                        AppLocalizations.of(context)!.arabic)),
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
      style:
      Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}
