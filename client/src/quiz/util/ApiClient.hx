package quiz.util;

import thx.Validation;
import thx.http.Request;
import thx.http.RequestInfo;
using thx.promise.Promise;
import quiz.state.Composer;

typedef ParseFunction<T> = Dynamic -> VNel<String, T>;

class ApiClient {
  public static function getComposers(): Promise<Array<Composer>> {
    var info = new RequestInfo(Get, thx.Url.fromString("/api/composers"));
    return Request.make(info, Json).body.flatMap(parseResponseArray.bind(Composers.parse));
  }

  static function parseResponseArray<T>(parse: ParseFunction<T>, val: thx.Any): Promise<Array<T>> {
    return parseResponse(thx.fp.Dynamics.parseArray.bind(_, parse, thx.Functions.identity), val);
  }

  static function parseResponse<T>(parse: ParseFunction<T>, val: thx.Any): Promise<T> {
    return switch parse(val).either {
      case Left(err): Promise.error(new thx.Error(err.toArray().join(" ")));
      case Right(v): Promise.value(v);
    };
  }
}
