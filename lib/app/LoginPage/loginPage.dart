import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMesage = '';
  var isCreatingaccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[100],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isCreatingaccount == true
                    ? 'zarejestruj się'
                    : 'zaloguj się'),
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
                    if (isCreatingaccount == true) {
                      //rejestracja
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: widget.emailcontroller.text,
                          password: widget.passwordcontroller.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMesage = error.toString();
                        });
                      }
                    } else {
                      //logowanie

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
                    }
                  },
                  child: Text(isCreatingaccount == true
                      ? 'zarejestruj się'
                      : 'zaloguj się'),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isCreatingaccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingaccount = true;
                      });
                    },
                    child: const Text('utwórz konto'),
                  ),
                ],
                if (isCreatingaccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingaccount = false;
                      });
                    },
                    child: const Text('masz już konto?'),
                  ),
                ],
              ],
            ),
          ),
        ));
  }
}
