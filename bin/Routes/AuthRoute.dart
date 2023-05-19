import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/login.dart';
import '../Responses/signup.dart';
import '../Responses/verify.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/signup', signup)
      ..post('/verify', verify)
      ..post('/login', login);

    return router;
  }
}
