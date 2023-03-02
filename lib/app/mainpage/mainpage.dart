import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imprezowe wyzwanie'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Witaj w aplikacji imprezowe wyzwanie!',
            ),
            Text(
              'jesteś zalogowany jako ${user.email}',
            ),
            const SizedBox(
              height: 70,
            ),
            const Text('Wybierz swoją płeć'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const KobietaPage()));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('kobieta'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const MezczyznaPage()));
                  },
                  child: const Text('mężczyzna'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
