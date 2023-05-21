import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../CusomResponse/customResponse.dart';
import '../services/EnvSupabse.dart';

loginUser(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());
    final supVariables = EnvSupabase().supabase.auth;

    await supVariables.signInWithOtp(email: body["email"]);
    var select = await EnvSupabase()
        .supabase
        .from("user")
        .select("id ,name")
        .eq("username", body["username"]);

    if (select == null) {
      return customresponse().errorStatus401(msg: "the username is not found");
    }

    await supVariables.signInWithPassword(
      email: body["email"], password: body["password"],
    );

   
    final token = supVariables.currentSession!.accessToken;

    return customresponse().successStatus200(
      msg: "login $select $token",
      //$id $name $token
    );
  } catch (AuthException) {

//duplicate username/email.

    return customresponse().errorStatus401(
      msg: "oops ! $AuthException",
    );
  }
}
