import 'package:flutter/material.dart';

class ExamList extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ExamList> {
  final List<String> questions = <String>[];


  TextEditingController nameController = TextEditingController();

  void addOpen(){
    setState(() {
      questions.insert(questions.length,'Open vraag');
    });
  }

  void addMulti(){
    setState(() {
      questions.insert(questions.length,'Multiple choice');
    });
  }


  void addCode(){
    setState(() {
      questions.insert(questions.length,'Code vraag');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Exam Questions'),
        ),
        body: Row(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: questions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: Center(
                              child: Text('${questions[index]} (${[index]})',
                                //style: TextStyle(fontSize: 18),
                              )
                          ),
                        );
                      }
                  )
              ),

              Expanded(
                child: Column(
                  children: [
                    ElevatedButton(
                    child: Text('Open vraag'),
                    onPressed: () {
                      addOpen();
                    },
                  ),

                  ElevatedButton(
                    child: Text('Multiple choice'),
                    onPressed: () {
                      addMulti();
                    },
                  ),

                    ElevatedButton(
                      child: Text('Code vraag'),
                      onPressed: () {
                        addCode();
                      },
                    ),

              ],
              ),
              )]
        )
    );
  }
}