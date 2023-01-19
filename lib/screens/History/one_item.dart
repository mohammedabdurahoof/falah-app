import 'package:flutter/material.dart';

class ItemOne extends StatelessWidget {
  const ItemOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 35,
                child: Text(
                  '12 Dec \n 2022',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '₹ 100.00',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(
                    '10:00 PM',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.red[900],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Pending',
                    style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
                // children: [
                //   Icon(
                //     Icons.circle,
                //     color: Colors.blue[900],
                //     size: 15,
                //   ),
                //   SizedBox(
                //     width: 5,
                //   ),
                //   Text(
                //     'Confrim',
                //     style: TextStyle(
                //         color: Colors.blue[900],
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold),
                //   )
                // ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
