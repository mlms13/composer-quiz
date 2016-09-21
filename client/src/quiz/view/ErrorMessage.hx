package quiz.view;

import doom.html.Html.*;

class ErrorMessage extends doom.html.Component<ErrorState> {
  override function render(): doom.core.VNode {
    return div([
      h1(props.title),
      p(props.message)
    ]);
  }
}

typedef ErrorState = {
  title: String,
  message: String
};
