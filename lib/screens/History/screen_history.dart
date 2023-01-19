import 'package:falah_app/screens/History/one_item.dart';
import 'package:flutter/material.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return const ItemOne();
        });
  }
}
