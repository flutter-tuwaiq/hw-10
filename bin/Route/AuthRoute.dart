import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/Login.dart';
import '../Response/Auth/SignUp.dart';
import '../Response/Auth/verifyEmailResponse.dart';

class AuthRoute {
  Router get handler {
    Router route = Router()
      ..post("/signup", signUp)
      ..post("/login", login)
      ..post("/verify-email", verificationEmail);

    return route;
  }
}
