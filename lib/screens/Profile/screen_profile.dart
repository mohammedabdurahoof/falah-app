import 'package:falah_app/screens/Profile/bottom_area.dart';
import 'package:falah_app/screens/Profile/top_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TopArea(),
        BottomArea(),
      ],
    );
  }
}
