import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imprezowe_wyzwanie/app/kobieta/kobieta.dart';
import 'package:imprezowe_wyzwanie/app/mezczyzna/mezczyzna.dart';

import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

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
          title: const Text('Imprezowe wyzwanie'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Witaj w aplikacji imprezowe wyzwanie!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.creepster(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 42.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'jesteś zalogowany jako ${user.email}',
                style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                'Wybierz swoją płeć:',
                style: GoogleFonts.lato(
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const KobietaPage(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('kobieta'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MezczyznaPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: const Text('mężczyzna'),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('wyloguj'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
