import 'package:shelf_router/shelf_router.dart';

import '../respons/loginResbons.dart';

class login {
  final loginRute = Router()..get('/user', loginResbons);
}
