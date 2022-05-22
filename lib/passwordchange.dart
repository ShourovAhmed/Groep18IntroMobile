import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Admin - Wachtwoord'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 800.0,
                  child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'e-mail',
                        hintText: 'Geef uw e-mail in',
                      ),
                      style: const TextStyle(
                        fontSize: 35.0,
                        height: 2.0,
                        color: Colors.black,

                      )
                  )
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200,80),
                    primary: Colors.orange
                ),
                child: const Text("Verstuur", style: TextStyle(fontSize: (40)),),
                onPressed: () {
                  PasswordReset(context);
                },
              ),
            ],
          )
      ),
    );
  }
  Future PasswordReset(contxt) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value) => Navigator.of(contxt).pop());
  }
}