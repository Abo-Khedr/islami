import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/hadeth/hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (verses.isEmpty) {
      loadHadethFile();
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/hadeth_logo.png",
            width: 312,
            height: 219,
          ),
          Divider(
            thickness: 3,
            color: provider.appTheme == ThemeMode.light ?
            AppColors.primaryColor :
            AppColors.primaryDarkColor,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Divider(
            thickness: 3,
            color: provider.appTheme == ThemeMode.light ?
            AppColors.primaryColor :
            AppColors.primaryDarkColor,
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: provider.appTheme == ThemeMode.light ?
                      AppColors.primaryColor :
                      AppColors.primaryDarkColor,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                        color: provider.appTheme == ThemeMode.light ?
                        AppColors.primaryColor :
                        AppColors.primaryDarkColor,
                    ),
                    itemCount: 50,
                    itemBuilder: (context, index) {
                      return HadethName(
                        title: verses[index].title,
                        content: verses[index].content,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  /// function load hadeth
  loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = content.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      print(ahadethList[i]);
      List<String> hadethLines = ahadethList[i].split('\n');
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: hadethTitle, content: hadethLines);
      verses.add(hadeth);
      setState(() {});
    }
  }
}

/// data class
class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
