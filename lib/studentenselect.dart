import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Firebase.dart';
import 'StudentenQuestion.dart';


class SelectStudent extends StatefulWidget {
  SelectStudent({Key? key}) : super(key: key);

  @override
  _SelectStudent createState() => _SelectStudent();
}
class _SelectStudent extends State<SelectStudent> {

  var studenten = <String,String>{};

  @override
  void initState() {
    /*
    firebase().GetStudents().then((studs) => {
      setState(() {
        this.studenten = studs;
      })
    });

     */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - verbeter examen'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionWidget()),
              );
            },
            child: Text('maak examen'),
          ),
          /*
          child: Column(
            children: [
              Row(
                children: [

                  ElevatedButton(
                      onPressed: fb.GetStudents,
                      child: Text("test"),
                  )
                ],
              ),
            ],
          ),
           */
        )
    );
  }
}