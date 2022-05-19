import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../ExamList.dart';
import '../Firebase.dart';
import 'QuestionInput.dart';

final fb = new firebase();
final q = TextEditingController();
final options = TextEditingController();
final solution = TextEditingController();


class MultiVraag extends StatelessWidget{
  late final Input input;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Mulitple Choice'),
        ),



        body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),

                Text('Multiple Choice:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                      controller: q,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          hintText: 'Geef uw vraag in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 1.5,
                            color: Colors.black
                        )
                    )
                ),

                SizedBox(
                  height: 30,
                ),

                Text('Opties:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                      controller: options,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          //hintText: 'Geef uw vraag in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 1.5,
                            color: Colors.black
                        )
                    )
                ),

                SizedBox(
                  height: 30,
                ),

                Text('Oplossing:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                      controller: solution,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          //hintText: 'Geef uw vraag in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 1.5,
                            color: Colors.black
                        )
                    )
                ),

                SizedBox(height: 30,),


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200,80),
                      primary: Colors.orange
                  ),
                  child: Text("Voeg toe", style: TextStyle(fontSize: (40)),),
                  onPressed: () {
                    input = Input(

                        question: q.text
                    );
                    //ExamList.questions.add(q.text);
                    FirebaseFirestore.instance.collection("Questions").add(
                      {
                        "question": q.text,
                        "index": 1,
                        "id": "multi",

                        "options": options.text.split(','),
                        "solution": solution.text
                      }
                    );

                    q.clear();
                    options.clear();
                    solution.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExamList()),
                    );
                  },
                )
              ],
            )
        )
    );
  }

}