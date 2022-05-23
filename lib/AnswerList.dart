Map<String, String> answerslijst = Map<String, String>();


class ListAnswers {

  Map<String, String> GetAnswers() {
    return answerslijst;
  }

  void AddAnswer(String id, String question){
    answerslijst[id] = question;
  }



}