package quiz.view;

import doom.html.Html.*;
using thx.Functions;
import quiz.State;

class App extends doom.html.Component<AppProperties> {
  override function render(): doom.core.VNode {
    return switch props.state {
      case Data(dataState): switch dataState {
        case Needed: button(["click" => props.actions.triggerLoadData], "Get Started");
        case Loading: button(["class" => "is-loading", "click" => props.actions.triggerLoadData], "Get Started");
        case NotEnough: new ErrorMessage({
          title: "Could not generate question",
          message: "There isn't enough data to create any questions"
        }).asNode();
        case Failed(msg): new ErrorMessage({
          title: "Failed to load data",
          message: msg
        }).asNode();
      };
      case Quiz(composers, question): new Question({
        composers: composers,
        question: question,
        actions: {}
      }).asNode();
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
