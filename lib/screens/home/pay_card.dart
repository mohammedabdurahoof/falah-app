import 'package:flutter/material.dart';

class PayCard extends StatelessWidget {
  const PayCard({super.key});

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
                onPressed: () {Navigator.of(context).pop();},
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
}
