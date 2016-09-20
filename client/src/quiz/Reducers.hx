package quiz;

import lies.Reduced;
using thx.Arrays;
using thx.Functions;
import thx.Functions.*;
import thx.Nel;
using thx.Options;

import quiz.Action;
import quiz.State;
import quiz.state.*;
import quiz.state.Question;
import quiz.util.ApiClient;

class Reducers {
  public static function quizApp(state: State, action: Action) {
    return switch action {
      case DisplayError(err): Reduced.fromState(Data(Failed(err)));
      case StartLoadingData: fetchData(state);
      case GenerateNextQuestion(composers): generateQuestion(composers);
      case DisplayQuestion(c, q): Reduced.fromState(Quiz(c, q));
      case AnswerQuestion: answerQuestion(state);
    };
  }

  static function fetchData(state: State): Reduced<State, Action> {
    var next = ApiClient.getComposers().mapEitherFuture(fn(GenerateNextQuestion(_)), fn(DisplayError(_.message)));
    return Reduced.fromState(state).withFuture(next);
  }

  static function createQuestion(state): Reduced<State, Action> {
    return Reduced.fromState(state); // TODO
  }

  static function answerQuestion(state): Reduced<State, Action> {
    return Reduced.fromState(state);
  }

  static function generateQuestion(composers: Array<Composer>) {
    var q = composers.map.fn(_.works).flatten().length > 0 && Math.random() < 0.5 ?
      Questions.generateCompositionIdentification(composers) :
      Questions.generateBornFirst(composers);

    return Reduced.fromState(q.cata(Data(NotEnough), fn(Quiz(composers, _))));
  }
}
