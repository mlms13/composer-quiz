package quiz.state;

import haxe.ds.Option;
using thx.Arrays;
using thx.Functions;
using thx.Nel;
using thx.Options;

enum Question {
  BornFirst(composers: Nel<Composer>);
  CompositionIdent(work: Composition);
}

class Questions {
  public static function displayTitle(q: Question): String {
    return switch q {
      case BornFirst(_): "Who was born first?";
      case CompositionIdent(_): "Identify the following piece:";
    };
  }

  static function similarByDate(all: Array<Composer>) {
    var rand = Math.floor(Math.random() * all.length),
        sorted = all.order.fn(thx.LocalDate.compare(_0.birth, _1.birth));

    return sorted.slice(thx.Ints.min(0, rand - 4), rand).concat(sorted.slice(rand + 1, rand + 4));
  }

  public static function generateBornFirst(all: Array<Composer>): Option<Question> {
    var subset = similarByDate(all).shuffle().slice(0, 4);
    return Nel.fromArray(subset).flatMap.fn(_.toArray().length < 2 ? None : Some(BornFirst(_)));
  }

  public static function generateCompositionIdentification(all: Array<Composer>): Option<Question> {
    var compositions = all.map.fn(_.works).flatten().shuffle();
    return Nel.fromArray(compositions).map.fn(CompositionIdent(_.head()));
  }
}
