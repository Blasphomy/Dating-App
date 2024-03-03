import 'package:dating/preferences.dart';
import 'package:flutter/material.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Setup',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: AssetImage('assets/images/images.jpeg'),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                  ),
                  onPressed: () {

                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Do you want to pick a photo?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {

                    _navigateToNextPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400],
                    onPrimary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text('Skip'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextPage(BuildContext context) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DatingPreferencesScreen(),
      ),
    );
  }
}
