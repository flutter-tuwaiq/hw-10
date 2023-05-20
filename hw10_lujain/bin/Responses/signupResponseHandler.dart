// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../Env/SupaBaseEnv.dart';
import '../models/studentModel.dart';
import 'ResponseMsg/responseMsg.dart';

signupResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supaBaseVar = SupaBAseEnv().supaBase;
    final database = supaBaseVar.from('student');
    List duplicateUser =
        await database.select().eq('username', body['username']);

    if (duplicateUser.isNotEmpty) {
      return ResponseMsg().errorResponse(
        message: 'This username is exist, enter another username',
      );
    }

    UserResponse createStudent = await supaBaseVar.auth.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );
    await supaBaseVar.auth.signInWithOtp(
      email: body['email'],
    );

    StudentModel student = StudentModel(
      username: body['username'],
      email: body['email'],
      name: body['name'],
      idAuth: createStudent.user!.id,
    );

    await database.insert(student.toMap());

    return ResponseMsg().successResponse(message: 'Sign up successfull!');
  } catch (e) {
    print(e);

    return ResponseMsg().errorResponse(message: 'There is something wrong....');
  }
}
