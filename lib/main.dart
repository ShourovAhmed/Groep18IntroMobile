import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intro_mobile_project/Timer.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'BottomBar.dart';
import 'studentenselect.dart';
import 'Timer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: FirstRoute()));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('EyeWatch'),
        ),
        body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Admin'),
                  onPressed: () {
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  },
                ),
                const SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Student'),
                  onPressed: () {
                    _showMyDialog(context);
                    if(Timer.seconds.isNaN){
                  _showMyDialog(context);
                  }
                    else{
                    // Navigate to second route when tapped.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectStudent()),
                    );
                    }
                  },
                ),
              ]),
        ));
  }
}

class SecondRoute extends StatelessWidget{
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return BottomNavBar();
        }
        else {
          return LoginWidget();
        }
      },
    ),
  );
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Warning"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('U heeft nog geen tijd toegevoegd!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}