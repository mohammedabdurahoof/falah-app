import 'package:falah_app/screens/home/screen_home.dart';
import 'package:falah_app/screens/login/screen_login.dart';
import 'package:falah_app/screens/main/screen_main.dart';
import 'package:falah_app/screens/register/screen_register.dart';
import 'package:falah_app/screens/screen_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ScreenMain(),
      
    );
  }
}
