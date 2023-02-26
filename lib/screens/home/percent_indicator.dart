import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({super.key, required this.percent});
  final percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CircularPercentIndicator(
        radius: 150,
        lineWidth: 20,
        percent: percent/100,
        progressColor: Colors.teal,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              '$percent%',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const Text(
              'Payment rate',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
