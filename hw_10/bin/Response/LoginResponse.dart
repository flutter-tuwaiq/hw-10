

import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../ResponseMsg/CustomResponse.dart';
import '../Services/Supabase/SupabaseEnv.dart';

LoginResponse(Request request)async{
  try {
    final Map body = jsonDecode(await request.readAsString());

    final supabase = SupabaseEnv().supabase;

    // create user varable to get user data 
    final List user = await supabase
        .from("user")
        .select("id, name , email")
        .eq("username", body["username"]);

    // if there is no username in database :
    if (user.isEmpty) {
      return CustomResponse().errorResponse(
        msg: "Username not found",
      );
    }

    // singin with email and password
    await supabase.auth.signInWithPassword(
      email: user[0]["email"],
      password: body["password"],
    );


    // caoll the successResponse massage methode to disbly succsses massage
    return CustomResponse().successResponse(
      msg: "Login successed",
      data: [user[0]],
    );


  } catch (error) {

    // caoll the errorResponse massage methode to disbly error massage

    return CustomResponse().errorResponse(msg: error.toString());
  }
}  
