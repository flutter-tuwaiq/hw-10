import 'package:shelf_router/shelf_router.dart';

import '../responses/login_res.dart';
import '../responses/root_res.dart';
import '../responses/signup_res.dart';

class MainRouter {
  Router get handler {
    final router = Router()
      ..all('/', rootHandler)
      ..post('/login', loginHandler)
      ..post('/signup', signupHandler);

    return router;
  }
}
