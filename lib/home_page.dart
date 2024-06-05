import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neru_lending/additional_file.dart';
import 'package:neru_lending/industry_page.dart';

class HomePage extends StatelessWidget {
  static const homePage = 'HomePage';
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AdditionalFiles additionalFiles = AdditionalFiles();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Choose the Industry'),
          Container(
            height: 650,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: additionalFiles.mainIndustryList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(context, IndustryPage.industryPage);
                        },
                        child: Card(
                          color: Colors.green.shade600,
                          child: ListTile(title: Text('Click to enter The ${additionalFiles.mainIndustryList[index].name} Portal')),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
