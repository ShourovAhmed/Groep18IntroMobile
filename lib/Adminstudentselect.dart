import 'package:flutter/material.dart';
import 'studentclass.dart';
import 'studentlist.dart';
import 'AdminExamen.dart';

/*
class SelectStudent extends StatefulWidget {
  const SelectStudent({Key? key}) : super(key: key);

  @override
  _SelectStudent createState() => _SelectStudent();
}
 */

class AdminSelectStudent extends StatelessWidget {
  AdminSelectStudent({Key? key}) : super(key: key);

  List<Student> slijst = [];
  List<ElevatedButton> blijst = [];

  var studenten = <String,String>{};
  int counter = 0;
  bool nostudents = false;
  bool astudent = false;


  /*
  @override
  void initState() {
    firebase().GetStudents().then((studs) => {
      setState(() {
        this.studenten = studs;
      })
    });
    super.initState();
  }
   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - verbeter examen'),
        ),
        body: Wrap(
            children: buildButtons(context)
          /*
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionWidget()),
              );
            },
            child: Text('maak examen'),
          ),
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
  List<Widget> buildButtons(BuildContext context) {
    slijst = ListStudents().GetStudents();
    for(int i = 0; i < slijst.length; i++) {
      if(slijst[i].ExamDone == true) {
        astudent = true;
        blijst.add(ElevatedButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExamAdminCheck(slijst[i].name, slijst[i].snumber)),
          );
        }, child: Text(slijst[i].name + " (" + slijst[i].snumber + ")")));
      }
      else if(slijst[i].ExamDone == false){
        nostudents = true;
      }
    }
    if(slijst.isEmpty){
      blijst.add(const ElevatedButton(onPressed: null, child: Text("Er zijn nog geen studenten toegevoegd")));
    }
    else if(nostudents == true && astudent == false) {
      blijst.add(const ElevatedButton(onPressed: null, child: Text("Er zijn geen studenten die een examen hebben gemaakt")));
    }
    return blijst;
  }
}