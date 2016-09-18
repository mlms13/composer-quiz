package quiz;

import quiz.state.*;

enum State {
  Data(state: DataState);
  QuizMode(composers: Array<Composer>, question: Question);
}

enum DataState {
  Needed;
  Loading;
  Failed(msg: String);
}
