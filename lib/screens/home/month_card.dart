import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TotalMonthCard extends StatelessWidget {
  const TotalMonthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          children: const [
            Text(
              'Total Month',
              style: TextStyle(
                fontSize: 25,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '115',
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
