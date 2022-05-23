Map<String, String> questionslijst = Map<String, String>();
List<String> options = [];

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

  void AddOption(List<String> opties){
    options = opties;
  }

  List<String> GetOptions(){
    return options;
  }

}