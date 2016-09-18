package quiz;

import quiz.state.*;


enum Action {
  StartLoadingData;
  DisplayError(err: String);
  GenerateNextQuestion(composers: Array<Composer>);
  DisplayQuestion(composers: Array<Composer>, q: Question);
  AnswerQuestion;
}
