package quiz.state;

abstract Year(Int) {}

abstract Filename(String) {}

typedef Composition = {
  name: String,
  published: Year,
  movements: Array<Movement>,
  sample: Filename
};
