import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';
import 'env/base_env.dart';
import 'routers/base_rout.dart';
void main() {
  withHotreload(() => createServer());
}
Future<HttpServer> createServer()async {
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(BaseRout().baseRout);
  final server = await serve(handler, BaseEnv().ip, BaseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}
