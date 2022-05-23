import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../AnswerList.dart';
import '../QuestionList.dart';

class QuestionOption extends StatefulWidget {
  const QuestionOption({Key? key}) : super(key: key);

  @override
  _State createState() {
    return _State();
  }

}

class _State extends State<QuestionOption>{
  //final answercontroller = TextEditingController();
  var Questionlist = ListQuestions().GetQuestions();
  var id = "multi";
  var Optionslist = ListQuestions().GetOptions();
  String val = "z";
  String radioItemHolder = "";

/*
  @override
  void dispose() {
    answercontroller.dispose();
  }

 */

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
              child: Text('${Questionlist[id]}', style: const TextStyle(fontSize: 40),),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(Optionslist[0]),
                  leading: Radio<String>(
                    value: Optionslist[0],
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        radioItemHolder = Optionslist[0];
                        val = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(Optionslist[1]),
                  leading: Radio<String>(
                    value: Optionslist[1],
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        radioItemHolder = Optionslist[1];
                        val = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(Optionslist[2]),
                  leading: Radio<String>(
                    value: Optionslist[2],
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        radioItemHolder = Optionslist[2];
                        val = value!;
                      });
                    },
                  ),
                )
              ],
            ),
            ElevatedButton(onPressed: () {
              FirebaseFirestore.instance.collection("Answers").add(
                  {
                    "question": Questionlist[id],
                    "answer": radioItemHolder,
                    "index": 1,
                    "id": "multi"
                  }
              );
              ListAnswers().AddAnswer("multi", radioItemHolder);
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