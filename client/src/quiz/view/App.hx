package quiz.view;

import doom.html.Html.*;
using thx.Functions;
import quiz.State;

class App extends doom.html.Component<AppProperties> {
  override function render(): doom.core.VNode {
    // return
    return switch props.state {
      case Data(dataState): switch dataState {
        case Needed: button(["click" => props.actions.triggerLoadData], "Get Started");
        case Loading: button(["class" => "is-loading", "click" => props.actions.triggerLoadData], "Get Started");
        case NotEnough: div([
          h1("Could Not Generate Question"),
          p("There isn't enough data to create any questions")
        ]);
        case Failed(msg): h1(msg);
      };
      case Quiz(_, q): switch q {
        case CompositionIdent(work): h1('Identify: ${work.name}');
        case BornFirst(list): div([
          h1("Which composer was born first"),
          ul(list.toArray().map.fn(li(_.firstName + " " + _.lastName)))
        ]);
      };
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
