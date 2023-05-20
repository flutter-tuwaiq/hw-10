import 'dart:convert';

import 'package:shelf/shelf.dart';

class resbunsmsg200 {
  resbonsok({required String msg, required Map data}) {
    return Response.ok(
      json.encode({"msg": msg, "status code": 200, "data": data}),
      headers: {'content-type': 'application/json'},
    );
  }
}
