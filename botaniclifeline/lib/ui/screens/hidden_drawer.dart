import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/ai_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:flutter_onboarding/ui/screens/journal_page.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:flutter_onboarding/constants.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  final mySTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final myTextStyle = TextStyle(
    fontSize: 17,
    color: Colors.grey.shade100,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Home',
            baseStyle: myTextStyle,
            selectedStyle: mySTextStyle,
            colorLineSelected: Colors.green,
          ),
          HomePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Journal',
            baseStyle: myTextStyle,
            selectedStyle: mySTextStyle,
            colorLineSelected: Colors.green,
          ),
          JournalPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Profile',
            baseStyle: myTextStyle,
            selectedStyle: mySTextStyle,
            colorLineSelected: Colors.green,
          ),
          ProfilePage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'AI',
            baseStyle: myTextStyle,
            selectedStyle: mySTextStyle,
            colorLineSelected: Colors.green,
          ),
          PlantDiseaseDetectionPage()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Color.fromARGB(255, 37, 51, 45),
      initPositionSelected: 0,
      slidePercent: 30, // Set the desired app bar height
      elevationAppBar: 0,
      styleAutoTittleName: TextStyle(
        color: Constants.primaryColor,
      ),
    );
  }
}
