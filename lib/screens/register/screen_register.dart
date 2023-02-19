// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falah_app/main.dart';
import 'package:falah_app/screens/login/screen_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final adnoController = TextEditingController();
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();
  final batchController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    adnoController.dispose();
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    batchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/image/logo.png'),
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    // Adno
                    TextFormField(
                      controller: adnoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Ad No',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // name
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // location
                    TextFormField(
                      controller: locationController,
                      decoration: const InputDecoration(
                        hintText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // batch
                    TextFormField(
                      controller: batchController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Batch',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // phone
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // email
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => singUp(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                      ),
                      child: const Text('Register'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        text: 'Do you have an account?  ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenLogin()),
                                );
                              },
                            text: 'Sign in',
                            style: const TextStyle(
                              color: Colors.teal,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future singUp(context) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => {
                print(value.user!.uid),
                users
                    .add({
                      'adno': adnoController.text.trim(),
                      'batch': batchController.text.trim(),
                      'date': '2023-02-01',
                      'email': emailController.text.trim(),
                      'location': locationController.text.trim(),
                      'name': nameController.text.trim(),
                      'phone': phoneController.text.trim(),
                      'uid': value.user!.uid,
                      'type': 'user',
                    })
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"))
              });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
