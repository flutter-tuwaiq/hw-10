import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response/login.dart';
import '../Response/signup.dart';

class AuthRoute{
  Handler get handler{
    final router=Router()
  ..post('/signup',signup)
  ..post('/login',login);
    return router;
}
}