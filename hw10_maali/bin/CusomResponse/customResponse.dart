import 'dart:convert';

import 'package:shelf/shelf.dart';

class customresponse {
//signup responses

  successStatus201({required String msg, Map? data}) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 201, "data": data}),
      headers: {'content-typr': 'application/json'},
    );
  }

  errorStatus400({
    required String msg,
  }) {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statusCode': 400}),
      headers: {'content-type': 'application/json'},
    );
  }

//login responses
  successStatus200({required String msg, Map? data}) {
    return Response.ok(
      json.encode({'msg': msg, 'statusCode': 200, "data": data}),
      headers: {'content-typr': 'application/json'},
    );
  }

  errorStatus401({
    required String msg,
  }) {
    return Response.badRequest(
      body: json.encode({'msg': msg, 'statusCode': 401}),
      headers: {'content-type': 'application/json'},
    );
  }
}
