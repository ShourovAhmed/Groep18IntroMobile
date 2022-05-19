import 'package:flutter/material.dart';

import '../ExamList.dart';

class MultiVraag extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Admin - Mulitple Choice'),
        ),



        body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),

                Text('Multiple Choice:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
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

                SizedBox(
                  height: 30,
                ),

                Text('Opties:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          //hintText: 'Geef uw vraag in',
                        ),
                        style: TextStyle(
                            fontSize: 40.0,
                            height: 2.0,
                            color: Colors.black
                        )
                    )
                ),

                SizedBox(
                  height: 30,
                ),

                Text('Oplossing:', style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 800.0,
                    child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //labelText: 'Open vraag',
                          //hintText: 'Geef uw vraag in',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExamList()),
                    );
                  },
                )
              ],
            )
        )
    );
  }

}