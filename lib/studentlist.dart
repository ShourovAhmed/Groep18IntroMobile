import 'studentclass.dart';

List<Student> studentenlijst = [];

class ListStudents {
  List<Student> GetStudents() {
    return studentenlijst;
  }
  void SetStudents(List<Student> lijst) {
    studentenlijst = lijst;
  }
}