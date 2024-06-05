import 'package:flutter/material.dart';
import 'package:neru_lending/additional_file.dart';
import 'package:neru_lending/service_page.dart';

class IndustryPage extends StatelessWidget {
  static const industryPage = 'Industry Page';
  IndustryPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdditionalFiles additionalFiles = AdditionalFiles();
    return Scaffold(
      appBar: AppBar(title: Text('Service'),),
      body: Container(
        child: ListView.builder(
            itemCount: additionalFiles.industryServiceList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ServicePage.servicePage);
                },
                child: Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(additionalFiles.industryServiceList[index].name,style: TextStyle(color: Colors.green.shade900),),
                    trailing: Icon(Icons.arrow_forward,color: Colors.green.shade900,),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
