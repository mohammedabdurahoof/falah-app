import 'package:flutter/material.dart';

class PaidCard extends StatelessWidget {
  const PaidCard({super.key, required this.totalPaidAmount});
  final totalPaidAmount;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Paid',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${totalPaidAmount / 100} Month',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(
                "₹ $totalPaidAmount.00",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ));
  }
}
