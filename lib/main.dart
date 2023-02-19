// import 'package:falah_app/screens/login/screen_login.dart';
import 'package:falah_app/screens/login/screen_login.dart';
import 'package:falah_app/screens/main/screen_main.dart';
import 'package:falah_app/screens/screen_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCokbWqYCVOl7RLtvVfHJI-L3J2rVJknE8",
      appId: "1:830437501481:web:3996b6d65396ff8c0c0a38",
      messagingSenderId: "830437501481",
      projectId: "falah-3fef5",
    ),
  );

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
        // home: const Text('joi'),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ScreenSplash();
              }else if(snapshot.hasError){
                return const Text('Somthing went wrong');
              }
               else if (snapshot.hasData) {
                return const ScreenMain();
              } else {
                return const ScreenLogin();
              }
            }));
  }
}
