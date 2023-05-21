import 'package:shelf_router/shelf_router.dart';

import '../Auth/createResponse.dart';
import '../Auth/verifyEmailResponse.dart';


class AuthRoute {
  Router get handler {
    final router = Router()
    ..post('/create_account',createResponse)
    ..post('/verify',verificatinEmail)
    ..post('/login',verificatinEmail);

    return router;
  }
}
