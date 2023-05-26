import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'Env/BaseEnv.dart';
import 'Routes/baseRoute.dart';

void main() async => withHotreload(() => createServer());

Future<HttpServer> createServer() async {
  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(baseRoute().handler);

  final server = await serve(handler, BaseEnv().ip, BaseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}
