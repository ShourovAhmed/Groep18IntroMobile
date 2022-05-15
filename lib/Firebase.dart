import 'package:cloud_firestore/cloud_firestore.dart';



class firebase{
  Future<void> AddStudents(String number, String name) async{
    await FirebaseFirestore.instance.collection("Studenten").where(
        'number', isEqualTo: number).get().then((value) async =>{
      if (value.size == 0) {
        await FirebaseFirestore.instance.collection("Studenten").add(
            {"name": name, 'snumber': number}
        )
      }
    });
  }
  Future<void> DeleteStudents(String number) async {
    await FirebaseFirestore.instance.collection("Studenten").where(
        'snumber', isEqualTo: number).get().then((value) =>
        value.docs.first.reference.delete());
  }

  Future<Map<String, String>> GetStudents() async {

    var studs = <String, String>{};

    await FirebaseFirestore.instance.collection("Studenten").get().then((value) => {
      value.docs.forEach((element) {
        studs[element.get('snumber')] = element.get('name');
      })
    });
    return studs;
  }
}