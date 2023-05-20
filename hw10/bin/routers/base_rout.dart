import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_rout.dart';



class BaseRout{
  Router get baseRout{
  final router = Router()..mount(("/student"), (AuthRout().aouthRout));

return router;
}}