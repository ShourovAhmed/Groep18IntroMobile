List<String> questionslijst = [];

class ListQuestions {

  List<String> GetQuestions() {
    return questionslijst;
  }
  void SetQuestion(List<String> lijst) {
    questionslijst = lijst;
  }

  void AddQuestion(String question){
    questionslijst.add(question);
  }

}