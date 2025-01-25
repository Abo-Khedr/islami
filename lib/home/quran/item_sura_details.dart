import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({super.key , required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    return Text("$content (${index+1})" ,textDirection: TextDirection.rtl,  style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center,);
  }
}
