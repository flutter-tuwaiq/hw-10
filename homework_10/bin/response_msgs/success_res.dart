import 'dart:convert';

import 'package:shelf/shelf.dart';

class SuccessRes {
  okResponse({required String msg, required List data}) {
    return Response.ok(
      json.encode({"msg": msg, 'status code': 200, 'data': data}),
      headers: {'content-type': 'application/json'},
    );
  }
}
