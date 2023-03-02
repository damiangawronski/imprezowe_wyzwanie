import 'package:flutter/material.dart';

class KobietaPage extends StatelessWidget {
  const KobietaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imprezowe wyzwanie dla kobiety'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Witaj w aplikacji imprezowe wyzwanie!',
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('losuj wyzwanie')),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('powrót do strony głównej')),
          ],
        ),
      ),
    );
  }
}
