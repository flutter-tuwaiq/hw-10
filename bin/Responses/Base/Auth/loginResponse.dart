// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../../Models/Student.dart';
import '../../../ResponseMsg/CustomResponse.dart';
import '../../../Services/SupaBase/supabaseEnv.dart';

final supabaseVar = SupabaseEnv().supabase.auth;

loginResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supaClient = SupabaseEnv().supabase;
    final stringBody = body.toString();

    // check body has a username & password
    if (!stringBody.contains('email') && !stringBody.contains('password')) {
      return CustomResponse().errorResponse(
        msg: "please enter username and password",
        statusCode: '400',
      );
    }

    // look for student in database
    List studentList = await supaClient.from('Student').select('*').match({
      'username': '${body['username']}',
    });

    if (studentList.isEmpty) {
      return CustomResponse().errorResponse(
        msg: "User not regestered, please create an account",
        statusCode: '400',
      );
    }

    //Student object
    Student student = Student.fromJson(json: studentList[0]);

    //login
    AuthResponse userInfo = await supabaseVar.signInWithPassword(
      email: student.email,
      password: body['password'],
    );

    // user session
    final session = userInfo.session;

    return CustomResponse().successResponse(
      msg: "user loged in",
      statusCode: 200,
      data: [
        student.toMap(),
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
