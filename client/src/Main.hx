
import lies.Store;
import quiz.*;
import quiz.State;

class Main {
  public static function main() {
    var store: Store<State, Action> = Store.create(Reducers.quizApp, Data(Needed));
    var actions = {
      triggerLoadData: function () { store.dispatch(StartLoadingData); }
    };

    var app = new quiz.view.App({ state: store.state, actions: actions });

    store.subscribe(function (state, _, _) {
      app.update({ state: state, actions: actions });
    });

    Doom.browser.mount(app, js.Browser.document.querySelector("#app"));
  }
}
