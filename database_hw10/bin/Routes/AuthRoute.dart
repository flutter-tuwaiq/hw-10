import 'package:shelf_router/shelf_router.dart';

import '../Responses/Auth/loginResponse.dart';
import '../Responses/Auth/signupResponse.dart';
import '../Responses/rootHandler.dart';

class AuthRoute {
  Router get route {
    final router = Router()
      ..get('/', rootHandler)
      ..post('/signup', signupResponse)
      ..post('/login', loginResponse);

    return router;
  }
}
