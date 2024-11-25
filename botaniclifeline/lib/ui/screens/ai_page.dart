import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_onboarding/constants.dart';

class PlantDiseaseDetectionPage extends StatefulWidget {
  @override
  _PlantDiseaseDetectionPageState createState() =>
      _PlantDiseaseDetectionPageState();
}

class _PlantDiseaseDetectionPageState extends State<PlantDiseaseDetectionPage> {
  Uint8List? _selectedImageBytes;
  String? _diagnosis;

  final Map<String, String> _fakeAiResponses = {
    'tomato_blight.jpg':
        'Diagnosis: Tomato Blight\nSolution: Remove infected leaves, avoid overhead watering, and use fungicide.',
    'potato_rot.jpg':
        'Diagnosis: Potato Rot\nSolution: Remove infected plants, improve soil drainage, and use crop rotation.',
    'healthy_plant.jpg':
        'Diagnosis: Healthy Plant\nSolution: No action needed!',
  };

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final fileName = pickedImage.name;
      final imageBytes = await pickedImage.readAsBytes(); // Get image as bytes
      setState(() {
        _selectedImageBytes = imageBytes;
        _diagnosis = _fakeAiResponses[fileName] ??
            'Diagnosis: Unknown Disease\nSolution: Please consult an expert.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the top
          children: [
            Text(
              'Upload an image to detect plant diseases',
              style: TextStyle(
                fontSize: 18,
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), // Reduced vertical spacing
            _selectedImageBytes != null
                ? Image.memory(
                    _selectedImageBytes!,
                    height: 200,
                  )
                : Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'No Image Selected',
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(height: 10), // Reduced vertical spacing
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: _diagnosis != null
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Constants.primaryColor),
                      ),
                      child: Text(
                        _diagnosis!,
                        style: TextStyle(
                          color: Constants.primaryColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
