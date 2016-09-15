
import lies.Store;
import quiz.*;
import quiz.State;

class Main {
  public static function main() {
    var store: Store<State, Action> = Store.create(Reducers.quizApp, LoadingData);
  }
}
