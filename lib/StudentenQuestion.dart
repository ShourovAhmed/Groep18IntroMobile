import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'Questions/OpenQuestion.dart';
import 'Questions/OptionQuestion.dart';
import 'Questions/CodeQuestion.dart';
import 'ExamEnd.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  _QuestionsWidget createState() => _QuestionsWidget();
}

class _QuestionsWidget extends State<QuestionWidget> with WidgetsBindingObserver{

  AppLifecycleState? notification;

  int EndTime = DateTime.now().millisecondsSinceEpoch + 1000 * 7200;


  @override
  void ChangeAppState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Student - Vragen'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.only(left: 25),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.orange
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: CountdownTimer(
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    endTime: EndTime,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Vraag 1'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionOpen()),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Vraag 2'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionOption()),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Vraag 3'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionCode()),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: Text('Beëindig examen'),
                onPressed: () {_showMyDialog(context);},
              ),
            ]),
      ),
    );
  }
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Examen alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Weet je het zeker?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ja'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExEnd()),
                );
              },
            ),
            TextButton(
              child: const Text('Nee'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}