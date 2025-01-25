import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg3.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            currentIndex: selectedItem,
            onTap: (index) {
              setState(() {
                selectedItem = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/quran.png",
                    height: 49,
                    width: 51,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/hadeth.png",
                    height: 49,
                    width: 51,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/sebha.png",
                    height: 49,
                    width: 51,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/radio.png",
                    height: 49,
                    width: 51,
                  ),
                  backgroundColor: AppColors.primaryColor,
                  label: "Radio"),
            ],
          ),
          body: tabs[selectedItem],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QurranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  ];
}
