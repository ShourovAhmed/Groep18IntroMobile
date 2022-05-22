import 'package:flutter/material.dart';
import 'studentclass.dart';
import 'studentlist.dart';
import 'StudentenQuestion.dart';

/*
class SelectStudent extends StatefulWidget {
  const SelectStudent({Key? key}) : super(key: key);

  @override
  _SelectStudent createState() => _SelectStudent();
}
 */

class SelectStudent extends StatelessWidget {
  SelectStudent({Key? key}) : super(key: key);

  List<Student> allslijst = [];
  List<Student> slijst = [];
  List<Row> blijst = [];

  var studenten = <String,String>{};


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
    allslijst = ListStudents().GetStudents();

    for (int i = 0; i < allslijst.length; i++) {
      if(studentenlijst[i].ExamDone == false) {
        slijst.add(allslijst[i]);
      }
    }
    if(slijst.length > 1) {
      for(int i = 0; i < slijst.length; i++) {
        blijst.add(Row(children: [
          const SizedBox(height: 50,),
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionWidget(slijst[i].snumber)),
            );
          }, child: Text(slijst[i].name + " (" + slijst[i].snumber + ")"))
        ],));
      }
    }
    else {
      blijst.add(Row(children: const [
        ElevatedButton(onPressed: null, child: Text("Er zijn geen studenten die een examen moeten afleggen"))
      ],));
    }
    return blijst;
  }
}