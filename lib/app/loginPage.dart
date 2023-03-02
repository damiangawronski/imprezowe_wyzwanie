import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatelessWidget {
  loginPage({
    Key? key,
  }) : super(key: key);

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('zaloguj się'),
            TextField(
              decoration: const InputDecoration(
                hintText: 'email',
              ),
              controller: emailcontroller,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'hasło',
              ),
              controller: passwordcontroller,
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                    );
                  } catch (error) {
                    print(error);
                  }
                },
                child: const Text(
                  'zaloguj się',
                ))
          ],
        ),
      ),
    ));
  }
}
