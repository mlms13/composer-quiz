package quiz;

// import thx.Nel;
import quiz.state.*;

enum State {
  Data(state: DataState);
  Quiz(composers: Array<Composer>, question: Question); // TODO: Nel, not Array
}

enum DataState {
  Needed;
  Loading;
  NotEnough;
  Failed(msg: String);
}
