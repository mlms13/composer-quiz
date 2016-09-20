package quiz.state;

using thx.Strings;
import thx.Validation;
import thx.Validation.*;
import thx.fp.Dynamics.*;

abstract PdfSrc(String) {
  function new(path: String) { this = path; }

  static function validate(path: String): VNel<String, PdfSrc> {
    return path.startsWith("/pdf") && path.endsWith(".png") ?
      successNel(new PdfSrc(path)) :
      failureNel('The string $path does not look like a pdf URL');
  }

  public static function parse(v: Dynamic): VNel<String, PdfSrc> {
    return parseString(v).flatMapV(validate);
  }
}
