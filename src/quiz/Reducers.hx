package quiz;

class Reducers {
  public static function quizApp(state: State, action: Action) {
    return switch action {
      case FetchData: fetchData(state);
      case CreateQuestion: createQuestion(state);
      case AnswerQuestion: answerQuestion(state);
    };
  }

  static function fetchData(state): State {
    return state;
  }

  static function createQuestion(state): State {
    return state;
  }

  static function answerQuestion(state): State {
    return state;
  }
}
