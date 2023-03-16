import 'package:falah_app/screens/History/screen_history.dart';
import 'package:falah_app/screens/Profile/screen_profile.dart';
import 'package:falah_app/screens/home/screen_home.dart';
import 'package:falah_app/screens/login/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdminScreenMain extends StatefulWidget {
  const AdminScreenMain({super.key});

  static  final List<Widget> _widgetOptions = <Widget>[
    ScreenHome(),
    const ScreenHistory(),
    const ScreenProfile(),
  ];

  @override
  State<AdminScreenMain> createState() => _AdminScreenMainState();
}

class _AdminScreenMainState extends State<AdminScreenMain> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FALAH'),
        // leading: Image(image: AssetImage('assets/image/logo.png')),
        actions: [IconButton(onPressed: () =>FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ScreenLogin()),
      )), icon: const Icon(Icons.logout))],
      ),
      body: SafeArea(
        child: Center(
          child: AdminScreenMain._widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[500],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
