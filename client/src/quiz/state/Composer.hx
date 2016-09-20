package quiz.state;

import haxe.ds.Option;
using thx.Functions;
import thx.LocalDate;
using thx.Validation;
import thx.Validation.*;
import thx.fp.Dynamics.*;

import quiz.state.Composition;

typedef Composer = {
  firstName: String,
  lastName: String,
  birth: LocalDate,
  death: Option<LocalDate>,
  works: Array<Composition>
};

class Composers {
  static function construct(first, last, birth, death, works): Composer {
    return {
      firstName: first,
      lastName: last,
      birth: birth,
      death: death,
      works: works
    };
  }

  public static function parse(v: Dynamic): VNel<String, Composer> {
    return val5(
      construct,
      parseString(v.firstName),
      parseString(v.lastName),
      parseLocalDate(v.birth),
      parseOptional(v.death, parseLocalDate),
      parseArray(v.works, Compositions.parse, Functions.identity),
      thx.Nel.semigroup()
    );
  }
}
