package quiz.state;

using thx.Strings;
import thx.Validation;
import thx.Validation.*;
import thx.fp.Dynamics.*;

abstract ImageSrc(String) {
  function new(path: String) { this = path; }

  static function hasImageExtension(path: String): Bool {
    return path.endsWith(".png") || path.endsWith(".jpg");
  }

  static function validate(path: String): VNel<String, ImageSrc> {
    return path.startsWith("/image") && hasImageExtension(path) ?
      successNel(new ImageSrc(path)) :
      failureNel('The string $path does not look like an image URL');
  }

  public static function parse(v: Dynamic): VNel<String, ImageSrc> {
    return parseString(v).flatMapV(validate);
  }
}
