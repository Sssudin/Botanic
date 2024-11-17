import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: Constants.blackColor,
    ),
    backgroundColor: Colors.transparent,
    elevation : 0,
  );
}