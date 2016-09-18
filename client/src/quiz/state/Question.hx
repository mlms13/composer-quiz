package quiz.state;

enum Question {
  RankComposers(composers: Array<Composer>);
  CompositionYear(composition: Composition);
}
