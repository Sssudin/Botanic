import 'package:flutter_onboarding/models/user.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath: 'assets/images/nabil.jpg',
    name: 'Nabil Firdaus',
    email: 'm.nabilfirdaus1084@gmail.com',
    about: 'A very handsome young boy that loves plants. Owner of 2 Rafflesia plants. Currently studying in Kolej GENIUS@Pintar Negara, Universiti Kebangsaan Malaysia.',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}