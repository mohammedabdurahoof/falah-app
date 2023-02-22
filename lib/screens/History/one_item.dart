import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemOne extends StatelessWidget {
  const ItemOne({super.key, required this.history});

  final Map<String, dynamic> history;

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
               CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 35,
                child: Text(
                  DateFormat.jms().format(history["date"].toDate()),
                  // '12 Dec \n 2022',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹ ${history["amount"]}.00",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                   Text(
                    DateFormat.yMd().format(history["date"].toDate()),
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              history["status"] == "pending"
                  ? Row(
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
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blue[900],
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Confrim',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
