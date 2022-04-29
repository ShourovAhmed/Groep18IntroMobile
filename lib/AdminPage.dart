import 'package:flutter/material.dart';
import 'main.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Home Admin'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Examenvragen'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Verbeter examens'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ]),
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
}