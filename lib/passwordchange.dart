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
                        fontSize: 35.0,
                        height: 2.0,
                        color: Colors.black,

                      )
                  )
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(200,80),
                    primary: Colors.orange
                ),
                child: Text("Verstuur", style: TextStyle(fontSize: (40)),),
                onPressed: () {
                  PasswordReset(context);
                },
              ),
            ],
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Examen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Studenten',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Wachtwoord wijzigen',

          ),
        ],
      ),
    );
  }
  Future PasswordReset(contxt) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text).then((value) => Navigator.of(contxt).pop());
  }
}