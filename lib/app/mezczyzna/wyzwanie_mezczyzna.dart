import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WyzwanieMezczyzna extends StatelessWidget {
  const WyzwanieMezczyzna({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Kobieta'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('mezczyzna')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('wystąpił nieoczekiwany błąd');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('trwa ładowanie strony');
                  }

                  final documents = snapshot.data!.docs;
                  final index = Random().nextInt(documents.length);

                  return Text(
                    documents[index]['zadanie'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.acme(
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
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
