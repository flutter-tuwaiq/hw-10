import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Models/StudentModel.dart';
import '../../ResponseMsg/ResponseMsg.dart';
import '../../Services/Supabase/supabaseEnv.dart';

signupResponse(Request req) async {
  try {
    final Map body = jsonDecode(await req.readAsString());

    final supabase = SupabaseEnv().supabase;
    String tableName = "Student";

    // check if username is exists or not
    final List usernameCheck = await supabase
        .from(tableName)
        .select()
        .eq("username", body["username"]);

    if (usernameCheck.isNotEmpty) {
      return ResponseMsg()
          .errorResponse(msg: "This username is already exists!");
    }

    // create user
    UserResponse userInfo = await supabase.auth.admin.createUser(
      AdminUserAttributes(
        email: body['email'],
        password: body['password'],
      ),
    );

    // send email for Authentication
    await supabase.auth.signInWithOtp(email: body["email"]);

    // create object from student model
    StudentModel student = StudentModel(
      username: body["username"],
      email: body["email"],
      name: body["name"],
      idAuth: userInfo.user!.id,
    );

    // insert student data in Student table
    await supabase.from(tableName).insert(student.toMap());

    // ------ success ------
    return ResponseMsg()
        .successResponse(msg: "Create account success", data: body);
  } catch (error) {
    return ResponseMsg().errorResponse(msg: error.toString());
  }
}
