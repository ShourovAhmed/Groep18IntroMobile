Map<String, String> questionslijst = Map<String, String>();

class ListQuestions {

  Map<String, String> GetQuestions() {
    return questionslijst;
  }
  void SetQuestion(Map<String, String> lijst) {
    questionslijst = lijst;
  }

  void AddQuestion(String id, String question){
    questionslijst[id] = question;
  }

}