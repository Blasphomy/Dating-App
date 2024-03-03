import 'dart:math';

import 'package:dating/login.dart';
import 'package:flutter/material.dart';
import 'package:dating/globals.dart' as globals;

class DatingPreferencesScreen extends StatefulWidget {
  const DatingPreferencesScreen({Key? key}) : super(key: key);

  @override
  _DatingPreferencesScreenState createState() => _DatingPreferencesScreenState();
}

class _DatingPreferencesScreenState extends State<DatingPreferencesScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  String genderPreference = 'Any';
  int minAgePreference = 18;
  int maxAgePreference = 30;
  List<String> selectedInterests = [];
  TextEditingController clubController = TextEditingController();
  TextEditingController collegeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select your Preferences',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender Preference',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight / 50),
              DropdownButton<String>(
                value: genderPreference,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                onChanged: (String? newValue) {
                  setState(() {
                    genderPreference = newValue!;
                  });
                },
                items: <String>['Any', 'Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: screenHeight / 30),
              Text(
                'Age Range Preference',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight / 50),
              Row(
                children: [
                  Expanded(
                    child: Text('Min Age: $minAgePreference'),
                  ),
                  Slider(
                    value: minAgePreference.toDouble(),
                    min: 18,
                    max: 60,
                    onChanged: (double value) {
                      setState(() {
                        minAgePreference = value.toInt();
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('Max Age: $maxAgePreference'),
                  ),
                  Slider(
                    value: maxAgePreference.toDouble(),
                    min: 18,
                    max: 60,
                    onChanged: (double value) {
                      setState(() {
                        maxAgePreference = value.toInt();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight / 30),
              Text(
                'Interests',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight / 50),
              Wrap(
                spacing: 8.0,
                children: _buildInterestChips(),
              ),
              SizedBox(height: screenHeight / 30),
              Text(
                'Club or Organization',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight / 50),
              TextFormField(
                controller: clubController,
                decoration: InputDecoration(
                  hintText: 'Enter Club or Organization',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 30),
              const Text(
                'College/University',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: screenHeight / 50),
              TextFormField(
                controller: collegeController,
                decoration: InputDecoration(
                  hintText: 'Enter College name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 30),
              ElevatedButton(
                onPressed: () {
                  globals.club = clubController.text;
                  globals.inst = collegeController.text;
                  // globals.age = ((minAgePreference+maxAgePreference)/2) as int;
                  Navigator.pop(context
                  );

                },
                child: Text('Save Preferences'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInterestChips() {
    List<String> interests = ['Music', 'Travel', 'Reading', 'Sports', 'Food'];
    return interests.map((interest) {
      return InputChip(
        label: Text(interest),
        selected: selectedInterests.contains(interest),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedInterests.add(interest);
            } else {
              selectedInterests.remove(interest);
            }
          });
        },
      );
    }).toList();
  }
}
