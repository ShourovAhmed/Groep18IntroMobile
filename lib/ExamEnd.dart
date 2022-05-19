import 'package:flutter/material.dart';
import 'main.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'studentlist.dart';
class ExEnd extends StatefulWidget{
  const ExEnd(this.number, this.time);

  final String number;
  final int time;


  @override
  _ExEnd createState() => _ExEnd(number, time);
}
class _ExEnd extends State<ExEnd> {
  _ExEnd(this.number, this.time);

  final String number;
  final int time;
  late Position pos;

  @override
  void initState() {
    Location().determinePosition().then((value) => {
      setState(() {
        this.pos = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Admin - Examen'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("U hebt het examen correct beëindigt"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                child: const Text('Terug'),
                onPressed: () {
                  UpdateStudent();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstRoute()),
                  );
                },
              )
            ]),
      ),
    );
  }
  void UpdateStudent() {
    ListStudents().UpdateLocation(number, pos.latitude.toString(), pos.longitude.toString());
    ListStudents().Settime(number, time);
    //firebase().UpdateStudentLocation("s112233", pos.longitude.toString(), pos.latitude.toString());  // test number
  }
}