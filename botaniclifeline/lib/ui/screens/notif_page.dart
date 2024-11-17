import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotifPage(),
    );
  }
}

class NotifPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: BackButton(
        color: Constants.blackColor, // <-- SEE HERE
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomContainer(
                title: 'Water plant - Sansieviera',
                subtitle: '22 mins ago',
              ),
              CustomContainer(
                title: 'Trim leaves - Meadow Sage',
                subtitle: '55 mins ago',
              ),
              CustomContainer(
                title: 'Humidity level alert - Beach Daisy',
                subtitle: '55 mins ago',
              ),
              CustomContainer(
                title: 'Water plant - Philodendron',
                subtitle: '55 mins ago',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomContainer({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.8),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 510,
      height: 80,
      child: Column(
        children: [
          SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 15.0,
              
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
