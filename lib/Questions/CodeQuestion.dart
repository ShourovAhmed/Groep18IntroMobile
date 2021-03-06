import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../AnswerList.dart';
import '../QuestionList.dart';

class QuestionCode extends StatelessWidget{

  final answercontroller = TextEditingController();
  var Questionlist = ListQuestions().GetQuestions();
  var id = "code";

  QuestionCode({Key? key}) : super(key: key);

  @override
  void dispose() {
    answercontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Student - Vragen'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text('Verbeter: ${Questionlist[id]}', style: const TextStyle(fontSize: 40),),
            ),
            TextField(
                controller: answercontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Geef hier uw antwoord',
                ),
                minLines: 1,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 25.0,
                  height: 1.0,
                  color: Colors.black,
                )
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {
              FirebaseFirestore.instance.collection("Answers").add(
                  {
                    "question": Questionlist[id],
                    "answer": answercontroller.text,
                    "index": 2,
                    "id": "code"
                  }
              );
              ListAnswers().AddAnswer("code", answercontroller.text);
            _showMyDialog(context);
            },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                child: const Text("Vul in")
            ),
          ]),
    );
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Bericht"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Uw antwoord is opgeslagen! '),
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