import 'package:flutter/material.dart';
import 'package:neru_lending/bottom_bar.dart';
import 'package:neru_lending/home_page.dart';
import 'package:neru_lending/industry_page.dart';
import 'package:neru_lending/service_page.dart';

void main() {
  runApp(NeruLending());
}


class NeruLending extends StatelessWidget {
  NeruLending({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: BottomBar.bottomBar,
      routes: {
        HomePage.homePage:(context)=> HomePage(),
        IndustryPage.industryPage:(context) => IndustryPage(),
        BottomBar.bottomBar:(context) => BottomBar()
      },
    );
  }
}

