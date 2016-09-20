package quiz;

import quiz.state.*;

enum State {
  Data(state: DataState);
  Quiz(composers: Array<Composer>, question: Question);
}

enum DataState {
  Needed;
  Loading;
  NotEnough;
  Failed(msg: String);
}
