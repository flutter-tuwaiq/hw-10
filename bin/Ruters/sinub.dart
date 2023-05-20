import 'package:shelf_router/shelf_router.dart';

import '../respons/sinubresbons.dart';

class sinub {
  final sinubRute = Router()..get('/user', sinubresbons);
}
