import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imprezowe_wyzwanie/app/kobieta/wyzwanie_kobieta.dart';
import 'package:imprezowe_wyzwanie/app/mezczyzna/mezczyzna.dart';

class KobietaPage extends StatelessWidget {
  const KobietaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("images/party.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                textAlign: TextAlign.center,
                style: GoogleFonts.creepster(
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const WyzwanieKobieta()));
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
      ),
    );
  }
}
