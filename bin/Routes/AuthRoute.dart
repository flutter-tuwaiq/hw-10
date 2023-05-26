// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Responses/Base/Auth/loginResponse.dart';
import '../Responses/Base/Auth/signupResponse copy.dart';
import '../Responses/Base/Auth/verifyemailResponse.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
      ..post('/signup', signupResponse)
      ..post('/verifyaccount', verificationEmail)
      ..post('/login', loginResponse);

    return router;
  }
}
