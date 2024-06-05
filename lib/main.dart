import 'package:flutter/material.dart';
import 'package:neru_lending/bottom_bar.dart';
import 'package:neru_lending/home_page.dart';
import 'package:neru_lending/industry_page.dart';
import 'package:neru_lending/provider_engine.dart';
import 'package:neru_lending/service_page.dart';
import 'package:neru_lending/welcome_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NeruLending());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class NeruLending extends StatelessWidget {
  NeruLending({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainEngine(),
      builder: (context, MainEngine) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          initialRoute: WelcomePage.welcomPage,
          routes: {
            HomePage.homePage: (context) => HomePage(),
            IndustryPage.industryPage: (context) => IndustryPage(),
            BottomBar.bottomBar: (context) => BottomBar(),
            WelcomePage.welcomPage: (context) => WelcomePage(),
            ServicePage.servicePage:(context) => ServicePage()
          },
        );
      },
    );
  }
}
