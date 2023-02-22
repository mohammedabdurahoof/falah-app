// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falah_app/screens/History/one_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('payment')
            .where('uid', isEqualTo: uid)
            .snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading");
          }
          // print(snapshot.data!.docs[0].data().runtimeType);
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return  ItemOne( history: snapshot.data!.docs[index].data(),);
              });
        });
  }
}
