package quiz.state;

using thx.Validation;
import thx.Validation.*;
import thx.fp.Dynamics.*;

typedef Composition = {
  name: String,
  published: PastYearCE,
  movements: Array<Movement>,
  sample: ImageSrc
};

class Compositions {
  static function construct(name, published, movements, sample): Composition {
    return {
      name: name,
      published: published,
      movements: movements,
      sample: sample
    };
  }

  public static function parse(v: Dynamic): VNel<String, Composition> {
    return val4(
      construct,
      parseString(v.name),
      PastYearCE.parse(v.published),
      successNel([]), // TODO
      ImageSrc.parse(v.sample),
      thx.Nel.semigroup()
    );
  }
}
