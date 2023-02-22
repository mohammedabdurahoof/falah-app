import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PayCard extends StatelessWidget {
  PayCard({super.key});
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Mark your paid cash',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    openPopUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ));
  }

  openPopUp(context) {
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 16,
          title: const Text('Pay Amount'),
          actions: [
            TextButton(
                onPressed: () {Navigator.of(context).pop();},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20),
                )),
            TextButton(
                onPressed: () {addPayment(context);},
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Pay',
                  style: TextStyle(fontSize: 20),
                )),
          ],
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.currency_rupee_rounded)),
            ),
          ),
        );
      },
    );
  }

  Future addPayment(context)async{
    CollectionReference payment = FirebaseFirestore.instance.collection('payment');
    await payment.add({
      'amount': amountController.text.trim(),
      'confirmDate':'null',
      'status': "pending",
      'uid':FirebaseAuth.instance.currentUser!.uid,
      'date':  DateTime.now().toLocal()

    }).then((value) => Navigator.of(context).pop());
  }
}
