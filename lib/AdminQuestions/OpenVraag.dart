import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../ExamList.dart';
import '../Firebase.dart';
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
                  onPressed: () {


                    input = Input(
                      question: myController.text
                    );

                    FirebaseFirestore.instance.collection("Questions").add(
                      {

                        "question": myController.text,
                        "index": 0,
                        "id": "open"
                      }

                    );
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