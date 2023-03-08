import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falah_app/screens/login/screen_login.dart';
import 'package:falah_app/screens/main/admin_screen_main.dart';
import 'package:falah_app/screens/main/screen_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        collection.where('uid', isEqualTo: user.uid).get().then((value) {
          var userData = value.docs[0].data();
          if (userData['type'] == 'admin') {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AdminScreenMain()),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ScreenMain()),
              (route) => false,
            );
          }
        });
      });
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ScreenLogin()),
                (route) => false,
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'assets/image/logo.png',
                  width: 200,
                ),
              ),
              // Text('Falah')
              // AssetImage('assets/image/logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}
