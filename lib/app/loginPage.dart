import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  loginPage({
    Key? key,
  }) : super(key: key);
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var errorMesage = '';

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
              controller: widget.emailcontroller,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'hasło',
              ),
              controller: widget.passwordcontroller,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(errorMesage),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailcontroller.text,
                      password: widget.passwordcontroller.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMesage = error.toString();
                    });
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
