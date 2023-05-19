import 'package:shelf/shelf.dart';

Response rootHandler(Request _) {
  return Response.ok('Server is working!');
}
