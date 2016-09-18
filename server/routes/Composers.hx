package routes;

import abe.App;

@:path("/composers")
class Composers implements abe.IRoute {
  @:get("/")
  function getComposers() {
    response.sendFile('composers.json', { root: './server/data'});
  }
}
