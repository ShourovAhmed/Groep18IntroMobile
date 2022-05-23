import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intro_mobile_project/QuestionList.dart';

import '../ExamList.dart';
import '../Firebase.dart';
import '../Questions.dart';
import 'QuestionInput.dart';



final fb = new firebase();
final myController = TextEditingController();
//late final Input input;


class OpenVraag extends StatelessWidget{
  late final Input input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Open Vraag'),
        ),



        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Open vraag:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          hintText: 'Geef uw vraag in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 2.0,
                            color: Colors.black
                        )
                    )
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200,80),
                      primary: Colors.orange
                  ),
                  child: Text("Voeg toe", style: TextStyle(fontSize: (40)),),
                  onPressed: () async {

                    /*
                    Question question = Question(
                      question: myController.text,
                      id: 0,
                    );

                     */

                    FirebaseFirestore.instance.collection("Questions").add(
                      {

                        "question": myController.text,
                        "index": 0,
                        "id": "open"
                      }

                    );
                    ListQuestions().AddQuestion("open", myController.text);

                    //await fb.addQuestion(question);
                    myController.clear();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExamList(

                      )),
                    );
                  },
                )
              ],
            )
        )
    );
  }

}