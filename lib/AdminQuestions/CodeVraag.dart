import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../ExamList.dart';
import '../Firebase.dart';
import 'QuestionInput.dart';

final fb = new firebase();
final vraag = TextEditingController();
final oplossing = TextEditingController();

class CodeVraag extends StatelessWidget{

  late final Input input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Code Vraag'),
        ),



        body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('Code vraag:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 600.0,
                        child: TextField(
                          controller: vraag,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //labelText: 'Open vraag',
                              hintText: 'Geef uw vraag in',
                            ),
                            style: TextStyle(
                                fontSize: 40.0,
                                height: 6.0,
                                color: Colors.black
                            )
                        )
                    ),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200,80),
                      primary: Colors.orange
                  ),
                  child: Text("Voeg toe", style: TextStyle(fontSize: (40)),),
                  onPressed: () {

                    input = Input(
                        question: vraag.text
                    );

                    FirebaseFirestore.instance.collection("Questions").add(
                      {
                        "question": vraag.text,
                        "index": 3,
                        "id": "code",

                        "solution": oplossing.text
                      }
                    );

                    vraag.clear();
                    oplossing.clear();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExamList()),
                    );
                  },
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('Code oplossing:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 600.0,
                        child: TextField(
                          controller: oplossing,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //labelText: 'Open vraag',
                              hintText: 'Geef het juiste antwoord',
                            ),
                            style: TextStyle(
                                fontSize: 40.0,
                                height: 6.0,
                                color: Colors.black
                            )
                        )
                    ),
                  ],
                )
              ],
            )
        )
    );
  }

}