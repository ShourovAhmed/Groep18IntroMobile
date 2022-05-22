import 'studentclass.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';

List<Student> studentenlijst = [];

class ListStudents {
  List<Student> GetStudents() {
    return studentenlijst;
  }
  void SetStudents(List<Student> lijst) {
    studentenlijst = lijst;
  }
  void UpdateExamenStudents(String number) {
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        studentenlijst[i].ExamDone = true;
      }
    }
  }
  void UpdateLocation(String number, String lat, String long) {
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        studentenlijst[i].long = long;
        studentenlijst[i].lat = lat;
      }
    }
  }
  double GetLong(String number){
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        return double.parse(studentenlijst[i].long);
      }
    }
    return 0.0;
  }
  double GetLat(String number){
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        return double.parse(studentenlijst[i].lat);
      }
    }
    return 0.0;
  }
  void Settime(String number, CurrentRemainingTime? time){
      for(int i = 0; i < studentenlijst.length; i++){
        if(studentenlijst[i].snumber == number) {
          studentenlijst[i].time = time;
      }
    }
  }
  CurrentRemainingTime? Gettime(String number) {
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        return studentenlijst[i].time;
      }
    }
  }
  void SetHasdoneexam(String number, bool examdone) {
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        studentenlijst[i].ExamDone = examdone;
      }
    }
  }
  bool GetHasdoneexam(String number) {
    for(int i = 0; i < studentenlijst.length; i++){
      if(studentenlijst[i].snumber == number) {
        return studentenlijst[i].ExamDone;
      }
    }
    return false;
  }
}