// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Responses/baseResponseHandler.dart';
import 'AuthRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..mount('/auth', AuthRoute().handler);

    return router;
  }
}
