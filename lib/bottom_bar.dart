import 'package:flutter/material.dart';
import 'package:neru_lending/dashboard_page.dart';
import 'package:neru_lending/home_page.dart';
import 'package:neru_lending/profile.dart';
import 'package:neru_lending/search_page.dart';


class BottomBar extends StatefulWidget {

  static const bottomBar = 'Bottom Bar';
  BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _screenOptions = [
    HomePage(),
    SearchPage(),
    DashboardPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBarWidget(_onItemTapped, _selectedIndex),
      backgroundColor: Colors.blueGrey.shade100,
      body: _screenOptions[_selectedIndex],
    );
  }
}

BottomNavigationBar buildBottomNavigationBarWidget(
    Function onTap, int selectedInt) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 28,
          color: Colors.white70,
        ),
        activeIcon: Icon(
          Icons.home,
          size: 28,
          color: Colors.white,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search_outlined,
          size: 28,
          color: Colors.white70,
        ),
        activeIcon: Icon(
          Icons.search,
          size: 28,
          color: Colors.white,
        ),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.message_outlined,
          size: 28,
          color: Colors.white70,
        ),
        activeIcon: Icon(
          Icons.dashboard,
          size: 28,
          color: Colors.white,
        ),
        label: 'Dash',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
          size: 28,
          color: Colors.white70,
        ),
        activeIcon: Icon(
          Icons.person,
          size: 28,
          color: Colors.white,
        ),
        label: 'Profile',
      ),
    ],
    currentIndex: selectedInt,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black54,
    backgroundColor: Color(0xFF35B079),
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      onTap(index);
    },
    elevation: 0, // No elevation for a flat design
    selectedLabelStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    selectedIconTheme: IconThemeData(
      size: 28,
      color: Colors.black,
    ),
    unselectedIconTheme: IconThemeData(
      size: 28,
      color: Colors.black87,
    ),
    showSelectedLabels: true, // Show labels for selected items
    showUnselectedLabels: false, // Show labels for unselected items
    iconSize: 28, // Set a fixed icon size
  );
}
