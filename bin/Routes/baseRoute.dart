// ignore_for_file: camel_case_types, file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'AuthRoute.dart';

class baseRoute {
  Router get handler {
    final router = Router()
      ..mount('/auth', AuthRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("please check that the path is correct");
      });

    return router;
  }
}
