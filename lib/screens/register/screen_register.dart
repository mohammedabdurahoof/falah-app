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
  final jobController = TextEditingController();
  final qualificationController = TextEditingController();
  
  var batch;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    adnoController.dispose();
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    batchController.dispose();
    jobController.dispose();
    qualificationController.dispose();

    super.dispose();
  }

  var batchs = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
  ];

  @override
  Widget build(BuildContext context) {
    var _category;
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
                    DropdownButtonFormField(
                      items: batchs.map((int batch) {
                        return DropdownMenuItem(
                            value: batch,
                            child: Row(
                              children: <Widget>[
                                const Text('batch '),
                                Text(batch.toString()),
                              ],
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        // do other stuff with _category
                        setState(() => batch = newValue);
                      },
                      value: batch,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey[200],
                        hintText: 'select batch',
                        //  errorText: errorSnapshot.data == 0 ? Localization.of(context).categoryEmpty : null),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // TextFormField(
                    //   controller: batchController,
                    //   keyboardType: TextInputType.number,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Batch',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    // job
                    TextFormField(
                      controller: jobController,
                      decoration: const InputDecoration(
                        hintText: 'Job',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // qualification
                    TextFormField(
                      controller: qualificationController,
                      decoration: const InputDecoration(
                        hintText: 'Qualification',
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
    List<List<int>> date = [
      [2022, 02, 01],
      [2016, 01, 01],
      [2016, 01, 01],
      [2016, 01, 01],
      [2016, 01, 01],
      [2016, 01, 01],
      [2016, 01, 01],
      [2016, 06, 01],
      [2017, 06, 01],
      [2018, 05, 01],
      [2019, 05, 01],
      [2020, 05, 01],
      [2021, 04, 01],
      [2022, 04, 01],
    ];
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
                      'batch': batch,
                      'date': DateTime.utc(
                        date[batch][0],
                        date[batch][1],
                        date[batch][2],
                      ),
                      'email': emailController.text.trim(),
                      'location': locationController.text.trim(),
                      'name': nameController.text.trim(),
                      'phone': phoneController.text.trim(),
                      'job': jobController.text.trim(),
                      'qualification': qualificationController.text.trim(),
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
