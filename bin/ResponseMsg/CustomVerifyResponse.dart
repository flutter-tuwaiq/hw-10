import 'dart:convert';

import 'package:shelf/shelf.dart';

class CustomVerifyResponse {
  errorResponse({required String msg}) {
    // data part is optional
    return Response.badRequest(
        body: json.encode({'msg': msg, 'StatusCode': 400,}),
        headers: {'Content-Type': 'application/json'},);
  }

  successResponse({required String msg}) {
    return Response.ok(
        json.encode({'msg': msg, 'StatusCode': 200,}),
        headers: {'Content-Type': 'application/json'},);
  }
}