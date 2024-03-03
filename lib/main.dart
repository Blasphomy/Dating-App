import 'package:dating/preferences.dart';
import 'package:dating/sign_in.dart';
import 'package:dating/splash.dart';
import 'package:dating/match.dart';
import 'package:flutter/material.dart';

import 'front.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  AnimatedSplashScreen (),
    );
  }
}


