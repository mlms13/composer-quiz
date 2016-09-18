package quiz.state;

using thx.Validation;
import thx.Validation.*;

abstract PastYearCE(Int) {
  function new(val: Int) { this = val; }

  static function validate(num: Int): VNel<String, PastYearCE> {
    return num > 0 && num <= thx.DateTime.now().year ?
      successNel(new PastYearCE(num)):
      failureNel('The year $num is out of range');
  }

  public static function parse(v: Dynamic): VNel<String, PastYearCE> {
    return thx.fp.Dynamics.parseInt(v).flatMapV(validate);
  }
}
