import 'package:falah_app/screens/home/amount_card.dart';
import 'package:falah_app/screens/home/month_card.dart';
import 'package:falah_app/screens/home/paid_card.dart';
import 'package:falah_app/screens/home/debit_card.dart';
import 'package:falah_app/screens/home/pay_card.dart';
import 'package:falah_app/screens/home/percent_indicator.dart';
import 'package:flutter/cupertino.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children:  [
          const PercentIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
            TotalMonthCard(),
            TotalAmountCard(),
          ],),
          const PaidCard(),
          const DebitCard(),
          const PayCard(),
        ],
      ),
    );
  }
}