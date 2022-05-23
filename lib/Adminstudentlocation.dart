import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'studentlist.dart';
import 'APIclasses/classAPI.dart';


class LocationStudent extends StatefulWidget {
  LocationStudent(this.number, {Key? key}) : super(key: key);

  final String number;

  @override
  _LocationStudent createState() => _LocationStudent(number);
}
class _LocationStudent extends State<LocationStudent> {
  _LocationStudent(this.number);

  late Album Url;

  @override
  void initState() {
    GetAddressFromLatLong().then((value) => {
      setState(() {
        Url = value;
      })
    });
    super.initState();
  }

  final String number;
  bool vsb = true;


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
                  Text(Url.address.postcode + " " + Url.address.city + " " + Url.address.road + " " + Url.address.house_number, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
            ]
          ),
        ));
  }
  Future<Album> GetAddressFromLatLong() async{
    final response = await http.get(Uri.parse('https://nominatim.openstreetmap.org/reverse.php?lat=${ListStudents().GetLat(number)}&lon=${ListStudents().GetLong(number)}&zoom=18&format=jsonv2'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}