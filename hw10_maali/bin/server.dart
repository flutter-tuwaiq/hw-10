import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'Routes/BaseRoutes.dart';
import 'env/env.dart';

/*
// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}
*/

void main() async {
  withHotreload(() => createServer());
}


  Future <HttpServer> createServer() async {
 
  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(baseroutes().handler);

  final server = await serve(handler, env().ip, env().port);
  print('Server listening on port ${server.port}');


  return server;
}
