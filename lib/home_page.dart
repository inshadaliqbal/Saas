import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neru_lending/additional_file.dart';
import 'package:neru_lending/industry_page.dart';

class HomePage extends StatelessWidget {
  static const homePage = 'HomePage';

  HomePage({super.key});

  // Define a map to associate each card name with an icon
  final Map<String, IconData> _iconsMap = {
    'Fitness': Icons.fitness_center,
    'Medical': Icons.local_hospital,
    'Real Estate': Icons.home,
    'Restaurant & Catering': Icons.restaurant_menu,
    'Automotive': Icons.directions_car,
    'Dealership': Icons.directions_car,
    'Trucking': Icons.local_shipping,
    'Hair Salon': Icons.spa,
    'Lawyer': Icons.gavel,
    'Photography': Icons.camera_alt,
    'Transportation': Icons.directions_bus,
    'Electrician': Icons.electrical_services,
    'Landscaping': Icons.landscape,
    'eCommerce': Icons.shopping_cart,
    'Musician': Icons.music_note,
    'Insurance': Icons.security,
    'Handy Man Servive': Icons.build,
    'Accountant': Icons.attach_money,
    'Cannabis': Icons.local_florist,
    'Wholesaler': Icons.storefront,
    'Barber': Icons.content_cut,
    'Spa Business': Icons.spa,
    'Therapist': Icons.healing,
    'Credit Repair Company': Icons.credit_card,
    'Wedding Planner': Icons.cake,
    'Construction': Icons.construction,
  };

  @override
  Widget build(BuildContext context) {
    AdditionalFiles additionalFiles = AdditionalFiles();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: const Color(0xFF35B079),
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text(
            'Choose the Industry',
            style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: additionalFiles.mainIndustryList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      IndustryPage.industryPage,
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _iconsMap[additionalFiles
                                    .mainIndustryList[index].name] ??
                                Icons
                                    .error, // Use icon associated with card name
                            size: 50,
                            color: const Color(0xFF35B079),
                          ),
                          SizedBox(height: 10),
                          Text(
                            additionalFiles.mainIndustryList[index].name,
                            style: TextStyle(
                              color: const Color(0xFF35B079),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
