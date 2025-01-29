import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/hadeth/hadeth.dart';
import 'package:islami/home/hadeth/hadeth_details.dart';

class HadethName extends StatelessWidget {
  String title;
  List<String> content;
  HadethName({super.key, required this.title , required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(HadethDetails.routeName , arguments: HadethModel(title: title, content: content));
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColors.whiteColor
          ),
          textAlign: TextAlign.center,
        ));
  }
}
