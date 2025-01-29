import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String title;
  List<String>content;
  ItemHadethDetails({super.key , required this.title , required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text("$title"
        "$content" ,textDirection: TextDirection.rtl,  style: provider.appTheme ==ThemeMode.light ?
    Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.titleSmall!.copyWith(
      color: AppColors.primaryDarkColor
    ) ,textAlign: TextAlign.center,);
  }
  }

