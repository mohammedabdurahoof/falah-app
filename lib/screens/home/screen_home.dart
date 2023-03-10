// import 'dart:ffi';

// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:falah_app/screens/home/amount_card.dart';
import 'package:falah_app/screens/home/month_card.dart';
import 'package:falah_app/screens/home/paid_card.dart';
import 'package:falah_app/screens/home/debit_card.dart';
import 'package:falah_app/screens/home/pay_card.dart';
import 'package:falah_app/screens/home/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  late int _totalMonth = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get()
        .then((val) {
      if (val.docs.isNotEmpty) {
        var doc = val.docs[0].data();
        int totalMonth =
            (DateTime.now().difference(doc['date'].toDate()).inDays / 30)
                .floor();
        setState(() {
          _totalMonth = totalMonth; // Future is completed with a value.
        });
        print(_totalMonth);
      } else {
        print("Not Found");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('payment')
                .where("uid", isEqualTo: uid)
                .snapshots(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final payment = snapshot.data!.docs;
              double totalPaidAmount = 0.0;
              for (int i = 0; i < payment.length; i++) {
                totalPaidAmount += double.parse(payment[i]['amount']);
              }

              int percent = 0;
              if (_totalMonth > 0) {
                percent = (totalPaidAmount / (_totalMonth * 100) * 100).floor();
                percent = percent > 100 ? 100 : percent;
              }

              return Column(
                children: [
                  PercentIndicator(percent: percent),
                  _totalMonth >= 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TotalMonthCard(totalMonth: _totalMonth),
                            TotalAmountCard(totalMonth: _totalMonth),
                          ],
                        )
                      : const SizedBox(),
                  PaidCard(totalPaidAmount: totalPaidAmount),
                  _totalMonth >= 0
                      ? DebitCard(
                          totalPaidAmount: totalPaidAmount,
                          totalMonth: _totalMonth)
                      : const SizedBox(),
                  PayCard(),
                ],
              );
            }));
  }
}
