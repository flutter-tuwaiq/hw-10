import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'AuthRoute.dart';

class BaseRoute {
  Handler get handler {
    final router = Router()
      ..get('/', checkServer)
      ..mount('/auth', AuthRoute().handler)
      ..all('/<name|.*>', (Route _) {
        return Response.notFound("Page is not found.");
      });

    return router;
  }
}

Response checkServer(Request _) {
  return Response.ok('Server is working');
}
