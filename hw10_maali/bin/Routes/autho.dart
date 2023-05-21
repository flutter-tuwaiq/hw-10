import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/login.dart';
import '../Responses/signup.dart';

class autho {
  Handler get handler {
    final router = Router()
      ..post('/signup', signupUser)
      ..post('/login', loginUser);

    return router;
  }
}
