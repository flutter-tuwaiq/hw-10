// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../../Models/Student.dart';
import '../../../ResponseMsg/CustomResponse.dart';
import '../../../Services/SupaBase/supabaseEnv.dart';

// repeated call variable
final supabaseVar = SupabaseEnv().supabase.auth;

signupResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final stringBody = body.toString();

    if (!stringBody.contains('email') ||
        !stringBody.contains('password') ||
        !stringBody.contains('name') ||
        !stringBody.contains('username')) {
      return CustomResponse().errorResponse(
        msg: 'please fill the regestration form',
        statusCode: '400',
      );
    }

    if (body['email'] == '' ||
        body['password'] == '' ||
        body['name'] == '' ||
        body['username'] == '') {
      return CustomResponse().errorResponse(
        msg: 'please fill the regestration form',
        statusCode: '400',
      );
    }

    AuthResponse userInfo = await supabaseVar.signUp(
      email: body['email'],
      password: body['password'],
    );

    Student newStudent = Student(
      username: body['username']!,
      password: body['password'],
      email: userInfo.user!.email!,
      name: body['name'],
      idAuth: userInfo.user!.id,
    );

    //insert user to table
    await SupabaseEnv().supabase.from("Student").insert(newStudent.toMap());

    //send auth otp via email
    await supabaseVar.signInWithOtp(email: body["email"]);

    // User session
    final session = userInfo.session;

    return CustomResponse().successResponse(
      msg: "create account page",
      statusCode: 201,
      data: [
        newStudent.toMap(),
        {'Token': session!.accessToken},
      ],
    );
  } on AuthException catch (error) {
    return CustomResponse()
        .errorResponse(msg: error.message, statusCode: error.statusCode);
  } on Exception catch (error) {
    return CustomResponse().errorResponse(msg: '$error', statusCode: '400');
  }
}
