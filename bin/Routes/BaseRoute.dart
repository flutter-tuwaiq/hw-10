import '../Responses/rootHandler.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class BaseRoute {

  Handler get handler {

    final router = Router()
      ..all("/", rootHandler )
      ..mount("/Auth",AuthRoute().handler);

    return router;
  }
}