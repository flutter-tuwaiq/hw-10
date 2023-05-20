

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/SignUpResponse.dart';
import '../Responses/loginResponse.dart';
import '../Responses/verifyResponse.dart';

class AuthRoute {

  Handler get handler {
    final router = Router()
    ..post("/login", loginRespons)
    ..post("/signup", createResponse)
    ..post("/verify", verifyResponse);

    return router;
  }


}