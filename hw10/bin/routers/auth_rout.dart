import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../response/login.dart';
import '../response/signup.dart';


class AuthRout{
  Router get aouthRout{
  final router = Router()..post('/login', login)..post('/signup', signup);

return router;
}}