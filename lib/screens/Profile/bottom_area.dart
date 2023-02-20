import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomArea extends StatefulWidget {
  const BottomArea({super.key});

  @override
  State<BottomArea> createState() => _BottomAreaState();
}

class _BottomAreaState extends State<BottomArea> {
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Flexible(
      flex: 3,
      child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('uid', isEqualTo: uid)
                  .snapshots(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading");
                }
                // snapshot.data is QuerySnapshot than I access .docs to get List<QueryDocumentSnapshot>
                var docs = snapshot.data!.docs;
                // Accessing single QueryDocumentSnapshot and then using .data() getting its map.
                final user = docs[0].data();
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${user["name"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // location
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${user["location"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // date
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_rounded,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${user["batch"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // phone
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${user["phone"]}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    // email
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.mail_outline,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${user["email"]}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              })),
    );
  }
}
