package quiz.view;

import doom.html.Html.*;
using thx.Functions;
using quiz.state.Question;

class Question extends doom.html.Component<QuestionProps> {
  override function render(): doom.core.VNode {
    return div(["class" => "q-question"], [
      h1(["class" => "q-question--title"], props.question.displayTitle()),
      div(["class" => "q-question--body"], [
        switch props.question {
          case CompositionIdent(work): p(work.name);
          case BornFirst(list): div([
            ul(list.toArray().map.fn(li(_.firstName + " " + _.lastName)))
          ]);
        }
      ])
    ]);
  }
}

typedef QuestionProps = {
  composers: Array<quiz.state.Composer>,
  question: quiz.state.Question,
  actions: QuestionActions
};

typedef QuestionActions = {
};
