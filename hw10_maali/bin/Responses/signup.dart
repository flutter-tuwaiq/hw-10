import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../CusomResponse/customResponse.dart';
import '../models/model.dart';
import '../services/EnvSupabse.dart';

signupUser(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());
    final supVariables = EnvSupabase().supabase.auth;

    var check = await EnvSupabase()
        .supabase
        .from("user")
        .select()
        .eq("email", body["email"]);

         var checkuser = await EnvSupabase()
        .supabase
        .from("user")
        .select()
        .eq("username", body["username"]);

    if (check != null) {
      return customresponse()
          .errorStatus400(msg: "email address has already been registered ");
    }
    if (checkuser != null) {
      return customresponse()
          .errorStatus400(msg: "username has already been registered ");
    }

    UserResponse info = await supVariables.admin.createUser(
      AdminUserAttributes(
        email: body["email"],
        password: body["password"],
      ),
    );

    model userobject = model(
        username: body["username"]!,
        // password: body["password"]!,
        email: info.user!.email!,
        name: body["name"]!,
        idAuth: info.user!.id);

    var create = userobject.Tomap();

//body["email"] or userInfo.user.email
    await supVariables.signInWithOtp(email: body["email"]);
    await EnvSupabase().supabase.from("user").insert(create);
    final token = supVariables.currentSession!.accessToken;

    return customresponse().successStatus201(
      msg: "create account page  $create $token",
      //$id $name $token
    );
  } catch (AuthException) {
//duplicate username/email.
    return customresponse().errorStatus400(
      msg: "sorry error ! $AuthException ",
    );
  }
}
