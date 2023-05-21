import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/BaseRoute.dart';
import 'env/BaseEnv.dart';

// Configure routes.
void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  
  final pipline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(BaseRoute().handler);
  
  final server = await serve(pipline, BaseEnv().ip, BaseEnv().port);
  print('Server listening on port ${server.port}');

  return server;
}