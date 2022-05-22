import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final int? id;
  final String question;


  Question(
      {this.id,
        required this.question
      });

  Map<String, dynamic> toMap() {
    return {
      'question': question,
    };
  }

  Question.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id as int,
        question = doc.data()!["question"];
}