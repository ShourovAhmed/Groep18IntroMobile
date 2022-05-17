import 'package:flutter/material.dart';
import 'Firebase.dart';

class GradeExam extends StatefulWidget {
  GradeExam({Key? key}) : super(key: key);

  @override
  _GradeExam createState() => _GradeExam();
}
class _GradeExam extends State<GradeExam> {

  var studenten = <String, String>{};
  var fb = firebase();

  @override
  void initState() {
    /*
    firebase().GetStudents().then((studs) =>
    {
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
            onPressed: testing,
            child: Text('press'),
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

  testing() {
    print("show students");
  }
}