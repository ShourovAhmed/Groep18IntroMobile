import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intro_mobile_project/studentlist.dart';


class LocationStudent extends StatelessWidget {
  LocationStudent(this.number, {Key? key}) : super(key: key);

  final String number;
  String adres = "";


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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Toon adres'),
                    onPressed: () {
                      GetAddressFromLatLong();
                    },
                  ),
                  Text(adres, style: const TextStyle(fontSize: 25),)
            ],
          ),
    ]
    ),
    ));
  }
  Future<void> GetAddressFromLatLong()async {
    List<Placemark> placemarks = await placemarkFromCoordinates(ListStudents().GetLat(number), ListStudents().GetLong(number));
    print(placemarks);
    Placemark place = placemarks[0];
    String Adress = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    adres = Adress;
  }
}