import 'package:flutter/material.dart';

class DebitCard extends StatelessWidget {
  const DebitCard({super.key, required this.totalPaidAmount, required this.totalMonth});
  final totalPaidAmount;
  final totalMonth;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.teal,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Debit',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${totalMonth- totalPaidAmount/100} Month',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(
                '₹ ${totalMonth*100 - totalPaidAmount}.00',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ));
  }
}
