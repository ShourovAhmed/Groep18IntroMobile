import 'package:flutter/material.dart';

import '../QuestionList.dart';

class QuestionOption extends StatefulWidget {
  const QuestionOption({Key? key}) : super(key: key);

  @override
  _State createState() {
    return _State();
  }

}

class _State extends State<QuestionOption>{
  final answercontroller = TextEditingController();
  var Questionlist = ListQuestions().GetQuestions();
  var id = "multi";
  var Optionslist = ListQuestions().GetOptions();
  String val = "z";

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
                        val = value!;
                      });
                    },
                  ),
                )
              ],
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionOption()),
              );
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