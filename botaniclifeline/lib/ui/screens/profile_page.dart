import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/user.dart' as AppUser; // Importing with an alias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_onboarding/models/userpreferences.dart';
import 'package:flutter_onboarding/models/profilewidget.dart';
import 'package:flutter_onboarding/ui/screens/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => EditProfilePage()),
                          );
                          setState(() {});
                        },
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Constants.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),

                buildAbout(user),
                
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                heroTag: "profile",
                onPressed: () {
                  signUserOut();
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(AppUser.User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user.email,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      );

  Widget buildAbout(AppUser.User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
}
