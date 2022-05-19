import 'package:flutter/material.dart';
import 'package:intro_mobile_project/AdminQuestions/OpenVraag.dart';
import 'Firebase.dart';
import 'Questions/CodeQuestion.dart';
import 'Questions/OpenQuestion.dart';
import 'Questions/OptionQuestion.dart';

final fb = new firebase();
final index = "";
final quest = "";
int counter = 0;
final List<String> questions = <String>[];
/*
@override
void dispose() {
  questions.dispose();
}

 */


class ExamList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ExamList> {



  TextEditingController nameController = TextEditingController();

  void addOpen(){
    setState(() {
      questions.insert(questions.length,'Open vraag');
      fb.AddQuestions('${questions.length}', 'Open vraag');
    });
  }

  void addMulti(){
    setState(() {
      questions.insert(questions.length,'Multiple choice');
      fb.AddQuestions('${questions.length}', 'Multiple choice');
    });
  }


  void addCode(){
    setState(() {
      questions.insert(questions.length,'Code vraag');
      fb.AddQuestions('${questions.length}', 'Code vraag');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Exam Questions'),
        ),
        body: Row(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: questions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                              child: Text('${questions[index]} (${[index]})',

                                //style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              ),

              Expanded(
                child: Column(
                  children: [

                    SizedBox(
                        height: 50
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    child: Text('Open vraag'),

                    onPressed: () {
                      //addOpen();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OpenVraag()),
                        );


                    },
                  ),

                  SizedBox(
                    height: 50
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //primary: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Multiple choice'),
                    onPressed: () {
                      addMulti();
                    },
                  ),

                    SizedBox(
                        height: 50
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //primary: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      child: Text('Code vraag'),
                      onPressed: () {
                        addCode();
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuestionCode()),
                        );*/

                      },
                    ),

              ],
              ),
              )]
        )
    );
  }
}