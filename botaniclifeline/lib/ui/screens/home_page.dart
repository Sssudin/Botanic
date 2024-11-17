import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/ui/screens/plantpages/sanseviera.dart';
import 'package:flutter_onboarding/ui/screens/plantpages/philodendron.dart';
import 'package:flutter_onboarding/ui/screens/plantpages/beachdaisy.dart';
import 'package:flutter_onboarding/ui/screens/plantpages/meadowsage.dart';
import 'package:flutter_onboarding/ui/screens/plantpages/plumbago.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_onboarding/ui/screens/notif_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class MenuItem {
  final String name;
  final String description;
  final Color color;
  final String imagePath;
  final Widget Function()
      redirectPageBuilder; // Add this field for the corresponding page widget

  MenuItem({
    required this.name,
    required this.description,
    required this.color,
    required this.imagePath,
    required this.redirectPageBuilder, // Make sure to provide the corresponding page widget function here
  });
}

class _HomePageState extends State<HomePage> {
  List<MenuItem> selectedItems = [
    MenuItem(
      name: 'Sanseviera',
      description: 'Asparagaceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-one.png',
      redirectPageBuilder: () =>
          SansevieraPage(), // Use the corresponding page widget here
    ),
  ];

  List<MenuItem> menuItems = [
    MenuItem(
      name: 'Sanseviera',
      description: 'Asparagaceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-one.png',
      redirectPageBuilder: () =>
          SansevieraPage(), // Use the corresponding page widget here
    ),
    MenuItem(
      name: 'Philodendron',
      description: 'Araceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-two.png',
      redirectPageBuilder: () =>
          PhilodendronPage(), // Use the corresponding page widget here
    ),
    MenuItem(
      name: 'Beach Daisy',
      description: 'Asteraceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-three.png',
      redirectPageBuilder: () =>
          BeachDaisyPage(), // Use the corresponding page widget here
    ),
    MenuItem(
      name: 'Meadow Sage',
      description: 'Lamiaceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-four.png',
      redirectPageBuilder: () =>
          MeadowSagePage(), // Use the corresponding page widget here
    ),
    MenuItem(
      name: 'Plumbago',
      description: 'Plumbaginaceae family',
      color: Constants.primaryColor.withOpacity(0.3),
      imagePath: 'assets/images/plant-six.png',
      redirectPageBuilder: () =>
          PlumbagoPage(), // Use the corresponding page widget here
    ),
  ];

  void addItem(MenuItem item) {
    setState(() {
      selectedItems.add(item);
    });
  }

  void removeItem(MenuItem item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 490,
              height: 120,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, Nabil.',
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotifPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text('Check your Plant Alerts'),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Constants.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = selectedItems[index];
                  return Dismissible(
                    key: Key(item.name),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16),
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      removeItem(item);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: item
                                .redirectPageBuilder(), // Use the redirectPageBuilder to get the correct page widget
                            type: PageTransitionType.topToBottom,
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Container(
                          width: 510,
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                item.imagePath,
                                width: 80,
                                height: 80,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Constants.primaryColor.withOpacity(0.6),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        item.description,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: menuItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = menuItems[index];
                            return ListTile(
                              onTap: () {
                                addItem(item);
                                Navigator.pop(context);
                              },
                              leading: Image.asset(
                                item.imagePath,
                                width: 40,
                                height: 40,
                              ),
                              title: Text(item.name),
                              subtitle: Text(item.description),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Add a plant',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
