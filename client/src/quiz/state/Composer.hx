package quiz.state;

import thx.LocalDate;

typedef Composer = {
  firstName: String,
  lastName: String,
  birth: LocalDate,
  death: LocalDate,
  works: Array<Composition>
};
