import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({super.key , required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text("$content (${index+1})" ,textDirection: TextDirection.rtl,  style: provider.appTheme==ThemeMode.light ?
    Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.titleSmall!.copyWith(
      color: AppColors.primaryDarkColor
    ),textAlign: TextAlign.center,);
  }
}
