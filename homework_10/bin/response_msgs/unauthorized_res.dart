import 'dart:convert';
import 'package:shelf/shelf.dart';

class UnauthorizedRes {
  errorResponse({required String msg}) {
    return Response.unauthorized(
      json.encode({"msg": msg, 'status code': 401}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
