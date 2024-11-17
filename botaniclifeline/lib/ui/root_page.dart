
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/earlyplants.dart';
import 'package:flutter_onboarding/ui/scan_page.dart';
import 'package:flutter_onboarding/ui/screens/notif_page.dart';
import 'package:flutter_onboarding/ui/screens/home_page.dart';
import 'package:flutter_onboarding/ui/screens/journal_page.dart';
import 'package:flutter_onboarding/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<EarlyPlant> favorites = [];
  List<EarlyPlant> myCart = [];

  int _bottomNavIndex = 0;

  void _updateCart(List<EarlyPlant> updatedCart) {
    setState(() {
      myCart = updatedCart;
    });
  }

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomePage(),
      JournalPage(),
      const ScanPage(),
      ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.book_rounded,
    Icons.checklist,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Journal',
    'Archive',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              color: Constants.blackColor, 
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: NotifPage(),
                    type: PageTransitionType.topToBottom,
                  ),
                );
              } 
              )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            final List<EarlyPlant> favoritedPlants = EarlyPlant.getFavoritedPlants();
            final List<EarlyPlant> addedToCartPlants = EarlyPlant.addedToCartPlants();

            favorites = favoritedPlants;
            myCart = addedToCartPlants.toSet().toList();
          });
        }
      ),
    );
  }
}
