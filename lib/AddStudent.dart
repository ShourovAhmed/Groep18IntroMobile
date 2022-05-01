import 'package:flutter/material.dart';
import 'AdminPage.dart';

class StudentAdd extends StatelessWidget {
  StudentAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Studenten'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'voornaam',
                          hintText: 'Geef de toe te voegen voornaam in',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'naam',
                          hintText: 'Geef de toe te voegen naam in',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'studenten nummer',
                          hintText: 's000000',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    onPressed: () {
                      AdminHome();
                    },
                    icon: Icon(Icons.add_circle_outline),
                    label: Text('Add field'),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200,80),
                      primary: Colors.orange,
                    ),
                    child: Text('Verstuur', style: TextStyle(fontSize: 40),),
                    onPressed: () {AdminHome();},
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}