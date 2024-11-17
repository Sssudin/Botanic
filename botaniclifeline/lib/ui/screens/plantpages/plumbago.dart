import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlumbagoPage(),
    );
  }
}

class PlumbagoPage extends StatefulWidget {
  const PlumbagoPage({Key? key}) : super(key: key);

  @override
  _PlumbagoPageState createState() => _PlumbagoPageState();
}

class _PlumbagoPageState extends State<PlumbagoPage> {
  bool r1 = false;
  bool r2 = false;
  String dropdownValue = 'Early';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Plumbago",
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
        child: Container(
          padding: const EdgeInsets.all(16),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: const ExactAssetImage('assets/images/plant-one.png'),
                    backgroundColor: Constants.primaryColor.withOpacity(.5),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.9),
                      width: 5.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 420,
                  child: Text(
                    'Reminders',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CheckboxListTile(
                  title: const Text('Water plants'),
                  subtitle: const Text('every second Friday'),
                  secondary: const Icon(Icons.create_rounded),
                  value: r1,
                  onChanged: (bool? value) {
                    setState(() {
                      r1 = value ?? false;
                    });
                  },
                  tileColor: Constants.primaryColor.withOpacity(.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: CheckboxListTile(
                  title: const Text('Replace fertilizer'),
                  subtitle: const Text('1st of September'),
                  secondary: const Icon(Icons.create_rounded),
                  value: r2,
                  onChanged: (bool? value) {
                    setState(() {
                      r2 = value ?? false;
                    });
                  },
                  tileColor: Constants.primaryColor.withOpacity(.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 4),
                child: Container(
                  width: 420,
                  child: Text(
                    'Plant health',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: .5),
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 460,
                height: 65,
                child: Row(
                  children: [
                    Text(
                      'Growth Stage',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: CenteredDropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'Early',
                            child: Text('Early Stage'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Vegetative',
                            child: Text('Vegetative Stage'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Flowering',
                            child: Text('Flowering Stage'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 460,
                height: 65,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Humidity level',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    Column(
                      children: [
                        LinearPercentIndicator(
                          width: 200,
                          center: Text(
                            '30.0%',
                            style: TextStyle(
                              color: Constants.primaryColor.withOpacity(.9),
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 22,
                          percent: 0.3,
                          progressColor: Constants.primaryColor,
                          backgroundColor: Constants.primaryColor.withOpacity(.2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 1),
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 460,
                height: 65,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Temperature level',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                    Column(
                      children: [
                        LinearPercentIndicator(
                          width: 200,
                          center: Text(
                            '20°C',
                            style: TextStyle(
                              color: Constants.primaryColor.withOpacity(.9),
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 22,
                          percent: 0.3,
                          progressColor: Constants.primaryColor,
                          backgroundColor: Constants.primaryColor.withOpacity(.2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              

              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 4),
                child: Container(
                  width: 420,
                  child: Text(
                    'Plant Care Tips',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 4),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        border: Border.all(
                          color: Constants.primaryColor.withOpacity(.9), // Set the desired border color
                          width: 1.0, // Set the desired border width
                        ),// Set the desired border radius
                      ), // Set the desired background color for the first ListTile
                      child: ListTile(
                        title: Text(
                          'Watering the plant',
                        ),
                        subtitle: Text(
                          'Water sparingly, typically every two to three weeks',
                        ),
                        leading: Icon(
                          Icons.water_drop,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        border: Border.all(
                          color: Constants.primaryColor.withOpacity(.9), // Set the desired border color
                          width: 1.0, // Set the desired border width
                        ), // Set the desired border radius
                      ), // Set the desired background color for the second ListTile
                      child: ListTile(
                        title: Text(
                          'Humidity and temperature of plant',
                        ),
                        subtitle: Text(
                          'Between 15°C and 29°C & normal room humidity',
                        ),
                        leading: Icon(
                          Icons.local_fire_department,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        border: Border.all(
                          color: Constants.primaryColor.withOpacity(.9), // Set the desired border color
                          width: 1.0, // Set the desired border width
                        ), // Set the desired border radius
                      ), // Set the desired background color for the second ListTile
                      child: ListTile(
                        title: Text(
                          'Lighting of environment',
                        ),
                        subtitle: Text(
                          'Thrives best in bright, indirect light',
                        ),
                        leading: Icon(
                          Icons.wb_sunny,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenteredDropdownButton<T> extends StatefulWidget {
  const CenteredDropdownButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final T value;
  final ValueChanged<T?>? onChanged;
  final List<DropdownMenuItem<T>> items;

  @override
  _CenteredDropdownButtonState<T> createState() => _CenteredDropdownButtonState<T>();
}

class _CenteredDropdownButtonState<T> extends State<CenteredDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.primaryColor.withOpacity(.9),
      ),
      child: Align(
        alignment: Alignment.center,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: widget.value,
            onChanged: widget.onChanged,
            items: widget.items,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            icon: const SizedBox(),
            alignment: Alignment.center, // Aligns the selected value in the center
            dropdownColor: Constants.primaryColor.withOpacity(.9), // Set the fixed background color
          ),
        ),
      ),
    );
  }
}
