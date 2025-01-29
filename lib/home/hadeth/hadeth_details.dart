import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/hadeth/hadeth.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/hadeth/item_hadeth_details.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth Details";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    final arg = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Stack(
      children: [
        provider.appTheme == ThemeMode.light
            ? Image.asset(
          "assets/images/bg3.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
            : Image.asset(
          "assets/images/dark_bg.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              arg.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: MediaQuery.of(context).size.height * 0.09),
                  decoration: BoxDecoration(
                      color: provider.appTheme == ThemeMode.light ?
                      AppColors.whiteColor :
                      AppColors.blueColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: provider.appTheme == ThemeMode.light ?
                        AppColors.primaryColor :
                        AppColors.primaryDarkColor,
                        thickness: 1,
                      );
                    },
                    itemCount: arg.content.length,
                    itemBuilder: (context, index) {
                      return ItemHadethDetails(
                        content: arg.content,
                        title: arg.title,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}
