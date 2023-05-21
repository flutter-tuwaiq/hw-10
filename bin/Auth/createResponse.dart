import 'dart:convert';
import 'dart:math';

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
    // UserResponse userInfo = await supabaseVariable.admin.createUser(
    //   AdminUserAttributes(email: body['email'], password: body['password']),
    // );
    var userInfo = (await supabaseVariable.signUp(
      email: body['email'],
      password: body['password'],
      data: body,
    ));
    Student student = Student(
      email: userInfo.user?.email,
      username: body['username'],
      idAuth: userInfo.user?.id,
      name: body['name'],
      id: Random().nextInt(999),
      // id: userInfo.user?.id,
    );

    // UserModel userObject =
    //     UserModel(email: userInfo.user!.email!, idAuth: userInfo.user!.id);
    await supabaseVariable.signInWithPassword(
        password: body['password'], email: body['email']);
    await SupabaseEnv().supabase.from("students").insert(student.toJson());

    return CustomResponse().successResponse(
      msg: "create account page",
      data: [
        {"email": body['email'], "username": body['username']},
      ],
    );
  } catch (e) {
    print(e);

    return CustomResponse().errorResponse(
      msg: "sorry you should have body",
    );
  }
}
