// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Responses/loginResponseHandler.dart';
import '../Responses/signupResponseHandler.dart';
import '../Responses/verifyResponseHandler.dart';

class AuthRoute {
  Router get handler {
    final router = Router()
      ..post('/signup', signupResponse)  //This endpoint is used to create a new user account and add the user to the user table
      ..post('/login', loginResponse)  //This endpoint is used to authenticate and login a use in a supabase
      ..post('/verify', verifyAccountHandler);

    return router;
  }
}
