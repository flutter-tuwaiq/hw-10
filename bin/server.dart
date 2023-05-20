import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Ruters/baseRute.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

// Configure routes.
void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(baseRute().router);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');

  return server;
}
