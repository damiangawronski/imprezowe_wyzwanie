import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imprezowe_wyzwanie/app/kobieta/kobieta.dart';
import 'package:imprezowe_wyzwanie/app/mezczyzna/wyzwanie_mezczyzna.dart';

class MezczyznaPage extends StatelessWidget {
  const MezczyznaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Mężczyzna'),
        backgroundColor: Colors.purple,
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
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const WyzwanieMezczyzna(),
                ));
              },
              child: const Text(
                'losuj',
              ),
            ),
            const SizedBox(
              height: 100,
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
                        MaterialPageRoute(builder: (_) => const KobietaPage()));
                  },
                  child: const Text(
                    'zmień na kobietę',
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
