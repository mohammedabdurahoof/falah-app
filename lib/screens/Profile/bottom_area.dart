import 'package:flutter/material.dart';

class BottomArea extends StatelessWidget {
  const BottomArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,bottom: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.person_outline,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Mohammed Abdu Rahoof',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // location
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,bottom: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Nilambur',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // date
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,bottom: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '16',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // phone
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,bottom: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '8943485194',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              // email
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 40,bottom: 15),
                child: Row(
                  children: const [
                    Icon(
                      Icons.mail_outline,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'mohammedabdurahoof527@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),

              
            ],
          ),
        ),
      ),
    );
  }
}
