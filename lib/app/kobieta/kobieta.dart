import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imprezowe_wyzwanie/app/kobieta/wyzwanie_kobieta.dart';
import 'package:imprezowe_wyzwanie/app/mainpage/mainpage.dart';
import 'package:imprezowe_wyzwanie/app/mezczyzna/mezczyzna.dart';

class KobietaPage extends StatelessWidget {
  const KobietaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Kobieta'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ZOBACZ SWOJE WYZWANIE',
              style: GoogleFonts.creepster(
                color: Colors.purple[900],
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const WyzwanieKobieta()));
              },
              child: const Text(
                'losuj ',
              ),
            ),
            const SizedBox(
              height: 70,
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
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const MezczyznaPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'zmień na mężczyznę',
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
