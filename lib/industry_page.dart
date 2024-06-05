import 'package:flutter/material.dart';
import 'package:neru_lending/additional_file.dart';
import 'package:neru_lending/service_page.dart';


class IndustryPage extends StatelessWidget {
  static const industryPage = 'Industry Page';

  IndustryPage({super.key});

  final List<IconData> _icons = [
    Icons.business,
    Icons.confirmation_number,
    Icons.business_center,
    Icons.location_on,
    Icons.account_balance,
    Icons.confirmation_number,
    Icons.web,
    Icons.print,
    Icons.phone,
    Icons.language,
    Icons.credit_card,
    Icons.email,
    Icons.assignment_turned_in,
    Icons.business,
  ];

  @override
  Widget build(BuildContext context) {
    AdditionalFiles additionalFiles = AdditionalFiles();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Service',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF35B079),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: additionalFiles.industryServiceList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ServicePage.servicePage);
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF35B079),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _icons[index % _icons.length],
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      additionalFiles.industryServiceList[index].name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: const Color(0xFF35B079),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
