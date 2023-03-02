import 'package:flutter/material.dart';

class MezczyznaPage extends StatelessWidget {
  const MezczyznaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imprezowe wyzwanie dla mężczyzny'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Witaj w aplikacji imprezowe wyzwanie!',
            ),
          ],
        ),
      ),
    );
  }
}
