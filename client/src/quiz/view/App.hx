package quiz.view;

import doom.html.Html.*;
import quiz.State;

class App extends doom.html.Component<AppProperties> {
  override function render(): doom.core.VNode {
    // return
    return switch props.state {
      case Data(dataState): switch dataState {
        case Needed: button(["click" => props.actions.triggerLoadData], "Get Started");
        case Loading: button(["class" => "is-loading", "click" => props.actions.triggerLoadData], "Get Started");
        case Failed(msg): h1(msg);
      };
      case Quiz(_): h1("quizmode");
    }
  }
}

typedef AppProperties = {
  state: quiz.State,
  actions: AppActions
};

typedef AppActions = {
  triggerLoadData: Void -> Void
};
