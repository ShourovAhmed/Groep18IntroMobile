import 'package:cloud_firestore/cloud_firestore.dart';



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
}