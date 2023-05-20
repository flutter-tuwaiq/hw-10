import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/Auth/loginResponse.dart';
import '../Responses/Auth/signupResponse.dart';
import '../Responses/Auth/verificationEmail.dart';

class AuthRoute {
  Handler get handler {
    final router = Router()
      ..post('/login', loginResponse)
      ..post('/signup', signUpResponse)
      ..post('/verfication', verificatioEmail);

    return router;
  }
}
