import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class BaseRoute {
  Router get route {
    final router = Router()
      ..mount('/auth', AuthRoute().route)
      ..all('/<name|.*>', (Request req) {
        return Response.notFound("Not Found Page! please try again.");
      });

    return router;
  }
}
