import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomLoginResponse {
  errorResponse({required String msg,}) {
    return Response.badRequest(
        body: json.encode({'msg': msg, 'StatusCode': 401,}),
        headers: {'Content-Type': 'application/json'},);
  }

  successResponse({required String msg, Map? data}) {
    return Response.ok(
        json.encode({'msg': msg, 'StatusCode': 200, 'data': data}),
        headers: {'Content-Type': 'application/json'},);
  }

}