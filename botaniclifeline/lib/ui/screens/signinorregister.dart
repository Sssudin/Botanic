import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/signin_page.dart';
import 'package:flutter_onboarding/ui/screens/register_page.dart';

class SigninOrRegisterPage extends StatefulWidget {
  const SigninOrRegisterPage({super.key});

  @override
  State<SigninOrRegisterPage> createState() => _SigninOrRegisterPage();
}

class _SigninOrRegisterPage extends State<SigninOrRegisterPage> {
  bool showSignIn = true;

  void togglePages() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
         onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}