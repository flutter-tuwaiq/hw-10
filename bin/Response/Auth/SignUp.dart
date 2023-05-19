import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Models/UserModel.dart';
import '../../ResponseMsg/CustomSignUpResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

signUp(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    final supabaseVariable = SupabaseEnv().supabase;
    final supabaseAuthVariable = SupabaseEnv().supabase.auth;

    if (body.keys.toString() != "(username, email, password, name)") {
      return CustomSignUpResponse()
          .errorResponse(msg: "Sorry invalid credentials. please try again.");
    }

    UserResponse userInfo =
        await supabaseAuthVariable.admin.createUser(AdminUserAttributes(
      email: body["email"],
      password: body["password"],
    ));

    UserModel userObject = UserModel(
      email: userInfo.user!.email!,
      idAuth: userInfo.user!.id,
      name: body["name"],
      username: body["username"],
    );

    await supabaseAuthVariable.signInWithOtp(
      email: body['email'],
    );

    await supabaseVariable.from("student").insert(userObject.toMap());

    return CustomSignUpResponse().successResponse(
      msg: "Successful Sign Up.",
      data: {
        "name": body["name"],
        "email": body["email"],
        "username": body["username"],
        "id": userInfo.user!.id,
      },
    );
  } catch (error) {
    return CustomSignUpResponse()
        .errorResponse(msg: "Sorry Invalid input or duplicate username/email.");
  }
}
