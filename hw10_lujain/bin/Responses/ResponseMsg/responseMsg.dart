// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';

class ResponseMsg {
  errorResponse({required String message}) {
    return Response.badRequest(
      body: json.encode({'message': message, 'statusCode': 400}),
      headers: {'Content-Type': 'application/json'},
    );
  }

  successResponse({required String message, Map? data}) {
    return Response.ok(
      json.encode({'message': message, 'statusCode': 200, 'data': data}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
