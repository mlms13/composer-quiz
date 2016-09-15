package quiz;

import quiz.state.*;

enum State {
  LoadingData;
  DataFailed(e: String);
  QuizMode(composers: Array<Composer>, question: Question);
}
