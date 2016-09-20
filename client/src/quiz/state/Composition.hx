package quiz.state;

using thx.Validation;
import thx.Validation.*;
import thx.fp.Dynamics.*;

typedef Composition = {
  name: String,
  published: PastYearCE,
  preview: ImageSrc,
  pdf: PdfSrc
};

class Compositions {
  static function construct(name, published, preview, pdf): Composition {
    return {
      name: name,
      published: published,
      preview: preview,
      pdf: pdf
    };
  }

  public static function parse(v: Dynamic): VNel<String, Composition> {
    return val4(
      construct,
      parseString(v.name),
      PastYearCE.parse(v.published),
      ImageSrc.parse(v.preview),
      PdfSrc.parse(v.pdf),
      thx.Nel.semigroup()
    );
  }
}
