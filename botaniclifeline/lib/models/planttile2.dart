import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class PlantTile2 extends StatefulWidget {
  final String plantImagePath;
  final String plantName;
  final String plantFamily;
  final String r1;
  final String rt1;
  final String r2;
  final String rt2;

  PlantTile2({
    required this.plantImagePath,
    required this.plantName,
    required this.plantFamily,
    required this.r1,
    required this.rt1,
    required this.r2,
    required this.rt2,
  });

  @override
  _PlantTile2State createState() => _PlantTile2State();
}

class _PlantTile2State extends State<PlantTile2> {
  bool r1 = false;
  bool r2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, bottom: 25, right: 10),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 257,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Constants.primaryColor.withOpacity(.7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.plantImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.plantName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.plantFamily,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CheckboxListTile(
                    title: Text(
                      widget.r1,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      ),
                    subtitle: Text(
                      widget.rt1,
                    ),
                    value: r1,
                    onChanged: (bool? value) {
                      setState(() {
                        r1 = value ?? false;
                      });
                    },
                    tileColor: Constants.primaryColor.withOpacity(.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  CheckboxListTile(
                    title: Text(
                      widget.r2,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      ),
                    subtitle: Text(
                      widget.rt2,
                    ),
                    value: r2,
                    onChanged: (bool? value) {
                      setState(() {
                        r2 = value ?? false;
                      });
                    },
                    tileColor: Constants.primaryColor.withOpacity(.35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}