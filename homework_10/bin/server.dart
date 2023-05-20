import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'env/base_env.dart';
import 'router/main_router.dart';

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(MainRouter().handler);
  final server = await serve(handler, BaseEnv.ip, BaseEnv.port);
  print('Server listening on port ${server.port}');

  return server;
}
