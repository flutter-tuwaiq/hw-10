import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount(
        '/auth',
        AuthRoute().handler,
      )
      ..all('/name|.*', (Request _) {
        return Response.forbidden("page not found please change");
      });

    return router;
  }
}
