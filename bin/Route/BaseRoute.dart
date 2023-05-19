import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class BaseRoute {
  Router get handler {
    Router route = Router()
    ..mount("/auth", AuthRoute().handler);

    return route;
  }
}
