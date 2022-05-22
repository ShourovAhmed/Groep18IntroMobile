import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_mobile_project/Questions.dart';
import 'AdminQuestions/CodeVraag.dart';
import 'AdminQuestions/OpenVraag.dart';
import 'AdminQuestions/MultiVraag.dart';
import 'AdminQuestions/QuestionInput.dart';
import 'Timer.dart';
import 'Firebase.dart';


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
  late Input input;

  //ExamList(this.input, {Key? key}) : super(key: key);

  @override
  _State createState() => _State();

}

class _State extends State<ExamList> {

  TextEditingController nameController = TextEditingController();
  Future<List<Question>>? qList;
  List<Question>? retrievedQList;

  List<Question> questions = [];
  //set questions(List<Question> questions) {}

  @override
  void initState(){
    //_initRetrieval();
    firebase().retrieveQuestions().then((value) => {
      setState((){
        questions = value;
      })
    });
    super.initState();
  }

  Future<void> _initRetrieval() async {
    qList = fb.retrieveQuestions();
    retrievedQList = await fb.retrieveQuestions();

}

  void refresh(){
    //questions.insert(questions.length, input.toString());
  }
/*
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
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Exam Questions'),
        ),
        body: ListView(
          children: [
            for(var question in questions)
              Container(
                height: 40,
                child: Text(question.question),
              ),
          ],
          /*
            children: <Widget>[
              Expanded(
                  child: FutureBuilder(
                     future: fb.getQuestions(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                       if (snapshot.hasData) {
                       print('=== data ===: ${snapshot.data}');
                       return ListView.builder(
                          itemCount: snapshot.data.length as int,
                           itemBuilder: (context, index){
                           return Text(snapshot.data[index].data['question']);
                           });
                       }
                       else{
                         return const Center(child: CircularProgressIndicator(),);
                       }
                      },
                      /*
                      builder: (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return ListView.separated(
                              itemCount: retrievedQList!.length,
                              separatorBuilder: (content, index) =>
                              const SizedBox(
                                height: 10,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 50,
                                    margin: EdgeInsets.all(2),

                                    child: Center(
                                        child: Text(
                                          '${[index]}',
                                          style: TextStyle(fontSize: 18),
                                        )
                                    )
                                );
                              }
                          );
                        }
                        else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      }*/
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
                      //addMulti();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MultiVraag()),
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
                      child: Text('Code vraag'),
                      onPressed: () {
                        //addCode();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CodeVraag()),
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
                      child: Text('Timer'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Timer()),
                        );


                        refresh();
                      },
                    ),
              ],
              ),
              )]


           */

        )
    );
  }
}