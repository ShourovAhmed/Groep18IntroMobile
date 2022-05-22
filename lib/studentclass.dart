import 'package:flutter_countdown_timer/current_remaining_time.dart';

class Student {
  late String snumber;
  late String name;
  late String long = "";
  late String lat = "";
  late CurrentRemainingTime? time;
  late bool ExamDone = false;

  Student(Number,Name) {
    this.snumber = Number;
    this.name = Name;
  }

  SetLocation(Long, Lat) {
    this.long = Long;
    this.lat = Lat;
  }

  Map<String,String> toMap(){
    return {
      "name":name,
      "snumber":snumber,
      "longitude": long,
      "latitude": lat,
    };
  }
  @override
  String toString() {
    return '{name: ${name}, snummer: ${snumber}, longitude: ${long}}, latitude: ${lat}}';
  }
}