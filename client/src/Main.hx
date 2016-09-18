
import lies.Store;
import quiz.*;
import quiz.State;

class Main {
  public static function main() {
    var store: Store<State, Action> = Store.create(Reducers.quizApp, Data(Needed));
    var app = new quiz.view.App({state: store.state});

    store.subscribe(function (state, _, _) {
      app.update({ state: state });
    });

    Doom.browser.mount(app, js.Browser.document.querySelector("#app"));
  }
}
