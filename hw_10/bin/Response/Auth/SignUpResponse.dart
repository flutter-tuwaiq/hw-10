import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../Models/Model.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

signUpResponse(Request request) async{

  try {
    
    // Create a map body variable and convert it to json

    final Map body = jsonDecode(await request.readAsString());

    // create subaEvn Varibles to deal with it more than one time

    final supEvn = SupabaseEnv().supabase;

    // check username is avalible

    final List checkUsername = await supEvn.from("user").select().eq("username", body["username"]);

    if (checkUsername.isNotEmpty) {
      return CustomResponse().errorResponse(msg: "Username already exists");
    }

    // create user
    UserResponse userInfo = await supEvn.auth.admin.createUser(
      AdminUserAttributes(
        email: body['email'],
        password: body['password'],
      ),
    );

    // send otp code to authtcation
    await supEvn.auth.signInWithOtp(email: body["email"]);

    // object model

    Model user = Model(
      username: body["username"],
      email: body["email"],
      name: body["name"],
      idAuth: userInfo.user!.id,
    );

    // insert student data in Student table
    await supEvn.from("user").insert(user.toMap());

    // call to successResponse massage mathode wiht data in the body 

    return CustomResponse().successResponse(msg: "Create account success", data: [body]
        );

  } catch (error) {

    // coall to errorResponse massage mathode 

    return CustomResponse().errorResponse(msg: error.toString());
  }
}



   