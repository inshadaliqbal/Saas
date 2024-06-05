import 'package:flutter/material.dart';
import 'package:neru_lending/home_page.dart';

void main() {
  runApp(NeruLending());
}


class NeruLending extends StatelessWidget {
  NeruLending({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.homePage,
      routes: {
        HomePage.homePage:(context)=> HomePage()
      },
    );
  }
}

