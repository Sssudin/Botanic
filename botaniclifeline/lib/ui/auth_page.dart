import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/root_page.dart';
import 'package:flutter_onboarding/ui/screens/signinorregister.dart';
import 'package:flutter_onboarding/ui/screens/hidden_drawer.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return const HiddenDrawer();
          }

          //user is NOT logged in
          else {
            return SigninOrRegisterPage();
          }
        },
      ),
    );
  }
}
