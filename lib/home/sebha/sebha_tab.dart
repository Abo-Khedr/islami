import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0.0;

  List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: provider.appTheme == ThemeMode.light
                      ? Image.asset(
                          "assets/images/head_sebha.png",
                          height: 105,
                        )
                      : Image.asset(
                          "assets/images/head_dark.png",
                          height: 105,
                        ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  counterMethod();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: provider.appTheme == ThemeMode.light
                          ? Image.asset(
                              "assets/images/sebha_logo.png",
                              width: 232,
                              height: 234,
                            )
                          : Image.asset(
                              "assets/images/sebha_dark.png",
                              width: 232,
                              height: 234,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            AppLocalizations.of(context)!.num_of_tasbeh,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Container(
              width: 69,
              height: 81,
              decoration: BoxDecoration(
                  color: provider.appTheme == ThemeMode.light
                      ? Color(0xffB7935F)
                      : AppColors.primaryDarkColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  "$counter",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.whiteColor
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              width: 137,
              height: 51,
              decoration: BoxDecoration(
                  color: provider.appTheme == ThemeMode.light
                      ? Color(0xffB7935F)
                      : AppColors.primaryDarkColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  "${tasbeh[index]}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  counterMethod() {
    angle += 10;
    if (counter == 33) {
      counter = 0;
      if (index < tasbeh.length - 1) {
        index++;
      } else {
        index = 0;
      }
    } else {
      counter++;
    }
    setState(() {});
  }
}
