import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TotalAmountCard extends StatelessWidget {
  const TotalAmountCard({super.key, required this.totalMonth});
  final totalMonth;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left:15,right: 15, top: 20, bottom: 20),
        child: Column(
          children:  [
            Text(
              'Total Amount',
              style: TextStyle(
                fontSize: 25,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${totalMonth*100}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
