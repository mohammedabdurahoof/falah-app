import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CircularPercentIndicator(
        radius: 150,
        lineWidth: 20,
        percent: 0.70,
        progressColor: Colors.teal,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '70%',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Text(
              'Payment rate',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
