import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopArea extends StatelessWidget {
  const TopArea({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Flexible(
      flex: 2,
      child: Container(
        width: double.infinity,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder(
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
              children:  [
                Text(
                   "${user["adno"]}",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                   "${user["name"]}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
              }
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/image/avatar.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
