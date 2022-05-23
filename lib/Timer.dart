import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ExamList.dart';

final myController = TextEditingController();

class Timer extends StatelessWidget{

  static late int seconds ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.orange,
    title: const Text('Admin - Timer'),
    ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Timer:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
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
                          hintText: 'Geef aantal seconden',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // Only numbers can be entered
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
                    seconds = int.parse(myController.text);
                    /*
                    FirebaseFirestore.instance.collection("Questions").add(
                      {

                        "question": myController.text,
                        "index": 0,
                        "id": "open"
                      }

                    );

                     */

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