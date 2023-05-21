import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Models/StudentModel.dart';
import '../Models/UserModel.dart';
import '../RespnseMag/CustomResponse.dart';
import '../Services/Supabase/SupabaseEnv.dart';

createResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    print(body);

    final supabaseVariable = SupabaseEnv().supabase.auth;
    var response = await SupabaseEnv()
        .supabase
        .from("students")
        .select('password,username')
        .eq('username', body['username'])
        .eq('password', body['password']);

    if (response == null) {
      var userInfo = await supabaseVariable.signInWithPassword(
          email: body['email'], password: body['password']);
      return Response.ok(
        {"msg": "user logged"},
      );
    } else {
      return Response.forbidden(
        {'msg': "wrong password"},
      );
    }

    // var student = Student.fromJson(userInfo.user.);
    // UserModel userObject =
    //     UserModel(email: userInfo.user!.email!, idAuth: userInfo.user!.id);
    // await supabaseVariable.signInWithOtp(email: body['email']);
    // await SupabaseEnv().supabase.from("users").insert(userObject.toMap());
  } catch (e) {
    print(e);

    return CustomResponse().errorResponse(
      msg: "sorry you should have body",
    );
  }
}
