package quiz.view;

import doom.html.Html.*;
import quiz.State;

class App extends doom.html.Component<AppProperties> {
  override function render(): doom.core.VNode {
    // return
    return switch props.state {
      case Data(dataState): switch dataState {
        case Needed: h1("data needed");
        case Loading: h1("loading data");
        case Failed(msg): h1(msg);
      };
      case QuizMode(_): h1("quizmode");
    }
  }
}

typedef AppProperties = {
  state: quiz.State,

}
