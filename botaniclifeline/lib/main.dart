import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/userpreferences.dart';
import 'ui/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.green),
          color: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
