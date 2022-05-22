import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'Adminstudentlocation.dart';
import 'studentlist.dart';


class ExamAdminCheck extends StatefulWidget {
  const ExamAdminCheck(this.name, this.number, {Key? key}) : super(key: key);

  final String name;
  final String number;

  @override
  _ExamAdminCheck createState() => _ExamAdminCheck(name, number);
}
class _ExamAdminCheck extends State<ExamAdminCheck>{
  _ExamAdminCheck(this.name, this.number);

  final String name;
  final String number;
  final answer = TextEditingController();

  bool vsbl = false;
  bool swtch = false;
  CurrentRemainingTime? time;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Studenten'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text("Vaardigheidstoets Intro Mobile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),   // naam firebase
                  const SizedBox(width: 200,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Toon antwoorden'),
                    onPressed: () {
                      gettime();
                      changevisibility();
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(name + " - " + number, style: const TextStyle(fontSize: 20),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                      width: 40.0,
                      height: 32,
                      child: TextField(
                          controller: answer,
                          style: const TextStyle(
                            fontSize: 25.0,
                            height: 2.0,
                            color: Colors.black,
                          )
                      )
                  ),
                  const Text(" /20", style: TextStyle(fontSize: 25),)
                ],
              ),
              Row(
                children: [
                  const SizedBox(height: 100,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Save'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExamAdminCheck("name", "number")),
                      );
                    },
                  ),
                  const SizedBox(width: 100,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Toon locatie'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LocationStudent(number)),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Visibility(
                    child: const Text("tijd over: ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    visible: vsbl,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                  ),
                ],
              ),
              Row(
                children: [
                  Visibility(
                    child: Text("${time?.hours}:${time?.min}:${time?.sec}", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    visible: vsbl,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
  void changevisibility() {
    if(vsbl == false){vsbl = true;}
    else{vsbl = false;}
    setState(() {

    });
  }
  void gettime() {
    time = ListStudents().Gettime(number);
  }
}