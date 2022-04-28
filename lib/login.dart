import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginWidget({Key? key}) : super(key: key);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin'),
        ),



        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 800.0,
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'e-mail',
                          hintText: 'Geef uw e-mail in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 2.0,
                            color: Colors.black
                        )
                    )
                ),
                SizedBox(height: 50,),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Wachtwoord',
                          hintText: 'Geef uw wachtwoord in',
                        ),
                        style: TextStyle(
                          fontSize: 35.0,
                          height: 2.0,
                          color: Colors.black,

                        )
                    )
                ),
                SizedBox(height: 50,),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200,80),
                      primary: Colors.orange
                  ),
                  icon: Icon(Icons.lock_open, size: 32,),
                  label: Text("Log in", style: TextStyle(fontSize: (40)),),
                  onPressed: signIn,
                )
              ],
            )
        )
    );
  }
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
  }
}