import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WyzwanieKobieta extends StatelessWidget {
  const WyzwanieKobieta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Kobieta'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'images/pytajnik.png',
              ),
              radius: 100,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('kobieta')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('wystąpił nieoczekiwany błąd');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('trwa ładowanie strony');
                  }

                  final wyzwania = snapshot.data!.docs;
                  final index = Random().nextInt(wyzwania.length);

                  return Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      wyzwania[index]['zadanie'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'powrót',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
