// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Responses/loginResponseHandler.dart';
import '../Responses/signupResponseHandler.dart';
import '../Responses/verifyResponseHandler.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
      ..post('/signup', signupResponse)
      ..post('/login', loginResponse)
      ..post('/verify', verifyAccountHandler);

    return router;
  }
}
