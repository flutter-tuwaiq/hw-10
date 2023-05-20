import 'dart:convert';

import 'package:shelf/shelf.dart';

import 'package:supabase/supabase.dart';

import '../resbonsmsg/resbonsmsg400.dart';
import '../resbonsmsg/resbunsmsg200.dart';
import '../subabase.dart/subabase.dart';

Future<Response> sinubresbons(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());
    // ignore: non_constant_identifier_names
    final Subabese = subabase().supabase;

    UserResponse mytebul = await Subabese.auth.admin.createUser(
      AdminUserAttributes(email: body["email"], password: body["password"]),
    );

    await Subabese.from("students").insert({
      "username": body["username"],
      "password": body["password"],
      "email": body["email"],
      "name": body["name"],
    });
    await Subabese.auth.signInWithOtp(
      email: body["email"],
    );

    return resbunsmsg200().resbonsok(msg: "creat user sinub ok", data: {
      'email': body["email"],
      "username": body["username"],
    });
  } catch (erore) {
    return resbonsmsg400().resbonsbad(msg: "erroore plase try agen");
  }
}
