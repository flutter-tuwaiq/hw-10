import 'dart:convert';

import 'package:shelf/shelf.dart';

class resbunsmsg201 {
  res201({required String msg, required List data}) {
    return Response(
      201,
      body: json.encode({"msg": msg, 'data': data}).toString(),
      headers: {'content-type': 'application/json'},
    );
  }
}
