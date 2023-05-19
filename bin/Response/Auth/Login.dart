import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../ResponseMsg/CustomLoginResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

login(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    final supabaseVariable = SupabaseEnv().supabase;
    final supabaseAuthVariable = SupabaseEnv().supabase.auth;

    if (body.keys.toString() != "(username, password)") {
      return CustomLoginResponse()
          .errorResponse(msg: "Sorry invalid credentials. please try again.");
    }

    final List check = await supabaseVariable
        .from("student")
        .select("name,email,id_auth")
        .eq("username", body["username"]);

    print("----------------------------------");
    if (check.isEmpty) {
      return CustomLoginResponse()
          .errorResponse(msg: "Sorry you have no account. Please sign up.");
    }

    final name = check[0]["name"];
    final email = check[0]["email"];
    final idAuth = check[0]["id_auth"];

    await supabaseAuthVariable.signInWithPassword(
      email: email,
      password: body["password"],
    );

    return CustomLoginResponse().successResponse(
        msg: "Successful login",
        data: {"name": name, "email": email, "id_auth": idAuth},);
  } catch (error) {
    print(error);
    
    return CustomLoginResponse().errorResponse(
        msg: "Sorry, please check your credentials or try again later.",);
  }
}
