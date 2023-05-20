

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/Auth/SignUpResponse.dart';
import '../Response/Auth/verifyEmailResponse.dart';
import '../Response/LoginResponse.dart';

class AuthRoute{
  Handler get handler{
    final router = Router()
    ..post("/signup", signUpResponse)
    ..post("/verifcatoin", verifyEmailResponse)
    ..post("/login", LoginResponse);

    return router;
    
  }
}