import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_mobile_project/QuestionList.dart';
import 'package:intro_mobile_project/Questions.dart';
import 'package:intro_mobile_project/main.dart';
import 'AdminQuestions/CodeVraag.dart';
import 'AdminQuestions/OpenVraag.dart';
import 'AdminQuestions/MultiVraag.dart';
import 'AdminQuestions/QuestionInput.dart';
import 'Timer.dart';
import 'Firebase.dart';


final fb = new firebase();

/*
@override
void dispose() {
  questions.dispose();
}
 */

//late List<String> questions = <String>[];

class ExamList extends StatefulWidget {


  //ExamList(this.input, {Key? key}) : super(key: key);

  @override
  _State createState() => _State();
  

}

class _State extends State<ExamList> {

  TextEditingController nameController = TextEditingController();
  Future<List<Question>>? qList;
  List<Question>? retrievedQList;
  late Map<String, String> questions = ListQuestions().GetQuestions();

 

  @override
  void initState(){
    _initRetrieval();
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
        body:           Row(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      itemCount: ListQuestions().GetQuestions().length,
                      itemBuilder: (BuildContext context, int index){
                        if(context != null){
                          return Container(
                            height: 50,
                            margin: EdgeInsets.all(2),

                            child: Center(
                              child: Text(questions.values.toList()[index],
                                style: TextStyle(fontSize: 18),
                              ),

                            ),

                          );
                        }
                        else{
                          return Text("");
                        }
                      })
                  /*FutureBuilder(
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
                      )*/
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
                        primary: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      child: Text('Timer'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Timer()),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 20),
                        textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      child: Text('Home'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstRoute()),
                        );
                      },
                    ),
              ],
              ),
              )]




        )
    );
  }
}