import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/quran/item_sura_details.dart';
import 'package:islami/home/quran/quran_model.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "Sura Details";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    final arg = ModalRoute.of(context)!.settings.arguments as Quran;
    if (verses.isEmpty) {
      loadFile(arg.index);
    }
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
              arg.suraName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: MediaQuery.of(context).size.height * 0.09),
                  decoration: BoxDecoration(
                      color: provider.appTheme == ThemeMode.light ?
                      AppColors.whiteColor : AppColors.blueColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: provider.appTheme == ThemeMode.light ?
                        AppColors.primaryColor : AppColors.primaryDarkColor,
                        thickness: 1,
                      );
                    },
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split("\n");
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}
