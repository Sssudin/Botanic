import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/userpreferences.dart';
import 'package:flutter_onboarding/models/user.dart';
import 'package:flutter_onboarding/ui/screens/widgets/textfield.dart';
import 'package:flutter_onboarding/ui/screens/widgets/appbar_widget.dart';
import 'package:flutter_onboarding/ui/screens/widgets/buttonwidget.dart';
import 'package:flutter_onboarding/models/profilewidget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 32),
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: user.imagePath,
          isEdit: true,
          onClicked: () {},
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Full Name',
          text: user.name,
          onChanged: (name) => user = user.copy(name: name),
        ),
        const SizedBox(height: 24),
          TextFieldWidget(
            label: 'Email',
            text: user.email,
            onChanged: (email) => user = user.copy(email: email),
          ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'About',
          text: user.about,
          maxLines: 5,
          onChanged: (about) => user = user.copy(about: about),
        ),
        const SizedBox(height: 24,),
        ButtonWidget(
          text: 'Save',
          onClicked: () {
            UserPreferences.setUser(user);
            Navigator.of(context).pop();
          },
        ),
      ],
    ),  
  );
}