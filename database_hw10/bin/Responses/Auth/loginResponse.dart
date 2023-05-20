import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../ResponseMsg/ResponseMsg.dart';
import '../../Services/Supabase/supabaseEnv.dart';

loginResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    final supabase = SupabaseEnv().supabase;

    // get student data by (username)
    final List loginStudent = await supabase
        .from("Student")
        .select("id, name , email")
        .eq("username", body["username"]);

    // if there is no username in database :
    if (loginStudent.isEmpty) {
      return ResponseMsg().errorResponse(
        msg: "You're trying to login with a username not exist !",
      );
    }

    // log in
    await supabase.auth.signInWithPassword(
      email: loginStudent[0]["email"],
      password: body["password"],
    );

    // get token from current session
    final token = supabase.auth.currentSession!.accessToken;

    // insert the token to student data to print it in response msg
    final Map data = loginStudent[0];
    data["token"] = token;

    // ------ success ------
    return ResponseMsg().successResponse(
      msg: "Login successfully",
      data: data,
    );
  } catch (error) {
    return ResponseMsg().errorResponse(msg: error.toString());
  }
}
