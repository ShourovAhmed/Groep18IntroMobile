import 'package:flutter/material.dart';
import 'Firebase.dart';
import 'studentclass.dart';

class StudentAdd extends StatelessWidget {

  final fb = new firebase();
  final students = TextEditingController();
  List<Student> studenten = [];
  final snumber = "";
  final name = "";
  int counter = 0;

  @override
  void dispose() {
    students.dispose();
  }


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
                  SizedBox(
                    width: 600,
                    child: TextField(
                        controller: students,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Studenten',
                          hintText: 's-nummer;vooraam naam',
                        ),
                        minLines: 1,
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 25.0,
                          height: 1.0,
                          color: Colors.black,
                        )
                    ),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(onPressed: () {Splitting(students.text, context);},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      child: Text("Voeg toe")
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
  Splitting(String AllStudents, ctxt) {
    counter = 1;
    final studentinfo = AllStudents;
    final split = studentinfo.split(';');
    final Map<int, dynamic> values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    for(int i = 0; i < values.length/2; i++){
      counter++;
      studenten.add(Student(values[i*2], values[i*2+1]));   //nummer, naam
      fb.AddStudents(studenten[i].snumber, studenten[i].name, false);
    }

    _showMyDialog(ctxt);
  }
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Firebase alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('${counter/2} student(en) toegevoegd'),
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
}