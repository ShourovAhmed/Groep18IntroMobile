import 'studentclass.dart';

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
}