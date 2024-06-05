import 'package:flutter/material.dart';
import 'package:neru_lending/additional_file.dart';

class HomePage extends StatelessWidget {
  static const homePage = 'HomePage';
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AdditionalFiles additionalFiles = AdditionalFiles();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min
        ,
        children: [
          Text('Choose the Industry'),
          Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: additionalFiles.MainIndustryList.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.red,
                  child: Text(additionalFiles.MainIndustryList[index].name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
