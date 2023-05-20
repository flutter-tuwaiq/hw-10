import 'dart:convert';

import 'package:shelf/shelf.dart';

class CreatedRes {
  createdResponse({required String msg, required List data}) {
    return Response(
      201,
      body: json
          .encode({"msg": msg, 'status code': 201, 'data': data}).toString(),
      headers: {'content-type': 'application/json'},
    );
  }
}
