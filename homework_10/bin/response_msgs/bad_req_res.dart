import 'dart:convert';
import 'package:shelf/shelf.dart';

class BadReqRes {
  errorResponse({required String msg}) {
    return Response.badRequest(
      body: json.encode({"msg": msg, 'status code': 400}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
