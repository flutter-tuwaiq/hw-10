import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../resbonsmsg/resbonsmsg400.dart';
import '../resbonsmsg/resbunsmsg200.dart';
import '../subabase.dart/subabase.dart';

Future<Response> loginResbons(Request req) async {
  try {
    final Subabase = subabase().supabase;
    final Map body = json.decode(await req.readAsString());

    final shicemail = Subabase.from("students").select("email");
    final shicpass = Subabase.from("students").select("password");
    if (shicemail != body["email"] || shicpass != body["password"]) {
      return resbonsmsg400()
          .resbonsbad(msg: "erore email or password plase try agen");
    }

    return resbunsmsg200().resbonsok(msg: "login ok", data: {
      'email': body["email"],
      "username": body["username"],
    });
  } catch (erorre) {
    return Response.ok('in the login ok');
  }
}
