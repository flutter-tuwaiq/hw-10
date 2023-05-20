import 'package:shelf_router/shelf_router.dart';

import 'login.dart';
import 'sinub.dart';

class baseRute {
  final router = Router()
    ..mount('/login', login().loginRute)
    ..mount('/sinub', sinub().sinubRute);
}
