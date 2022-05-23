import 'package:cloud_firestore/cloud_firestore.dart';

import 'Questions.dart';



class firebase{
  Future<void> AddStudents(String number, String name, bool exam) async{
    await FirebaseFirestore.instance.collection("Studenten").where(
        'number', isEqualTo: number).get().then((value) async =>{
      if (value.size == 0) {
        await FirebaseFirestore.instance.collection("Studenten").add(
            {"name": name, 'snumber': number,"exam done": exam, "longitude:" : "", "latitude": ""}
        )
      }
    });
  }
  Future<void> DeleteStudents(String number) async {
    await FirebaseFirestore.instance.collection("Studenten").where(
        'snumber', isEqualTo: number).get().then((value) =>
        value.docs.first.reference.delete());
  }

  Future<void> UpdateStudentLocation(String number, String long, String lat) async {
    await FirebaseFirestore.instance.collection("Studenten").where(
        'snumber', isEqualTo: number).get().then((value) =>
        value.docs.first.reference.update(
            {"longitude": long, "latitude": lat}
        ));
  }

  Future<Map<String, String>> GetStudents() async {           //Future<Map<String, String>>

    var studs = <String, String>{};

    await FirebaseFirestore.instance.collection("Studenten").get().then((value) => {
      value.docs.forEach((element) {
        studs[element.get('snumber')] = element.get('name');
      })
    });
    return studs;
  }

  Future<void> AddQuestions(String index, String question) async{
    await FirebaseFirestore.instance.collection("Questions").where(
        'index', isEqualTo: index).get().then((value) async =>{
      if (value.size == 0) {
        await FirebaseFirestore.instance.collection("Questions").add(
            {"question": question, 'index': index}
        )
      }
    });
  }

  /*
  Future<Iterable<String>> GetQuestions() async {

    var questions = <String, String>{};

    await FirebaseFirestore.instance.collection("Questions").get().then((value) => {
      value.docs.forEach((element) {
        questions[element.get('index')] = element.get('question');
      })
    });
    return questions.values;
  }


   */

  addQuestion(Question questionData) async {
    await FirebaseFirestore.instance.collection("Questions").add(questionData.toMap());
  }

  Future<List<Question>> retrieveQuestions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection("Questions").get();
    return snapshot.docs
        .map((docSnapshot) => Question.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future getQuestions() async {
    QuerySnapshot<Map<String, dynamic>> qn = await FirebaseFirestore.instance.collection("Questions").get();
    return qn;
  }

  Future<void> AddAnswers(String index, String answer) async{
    await FirebaseFirestore.instance.collection("Answers").where(
        'index', isEqualTo: index).get().then((value) async =>{
      if (value.size == 0) {
        await FirebaseFirestore.instance.collection("Answers").add(
            {"answer": answer, 'index': index}
        )
      }
    });
  }

}