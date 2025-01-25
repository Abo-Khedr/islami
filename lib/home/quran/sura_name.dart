import 'package:flutter/material.dart';
import 'package:islami/home/quran/quran_model.dart';
import 'package:islami/home/quran/sura_details.dart';

class SuraName extends StatelessWidget {
  List<String>suraList = [];
  int index;
  SuraName({super.key , required this.suraList , required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetails.routeName , arguments: Quran(suraName: suraList[index], index: index));
      },
      child: Text(
        suraList[index],
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );;
  }
}
