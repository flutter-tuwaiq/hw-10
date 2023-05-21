import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'autho.dart';

class baseroutes {
  Handler get handler {
    final router = Router()..mount('/auth', autho().handler);

    return router;
  }
}
