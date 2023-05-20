import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../msg/response_msg.dart';
import '../services/supabase_env.dart';



login(Request req) async {
  try{
    final body = json.decode(await req.readAsString());

    await SupabaseEnv().supabase.auth.signInWithPassword(email:body['email'],password: body['password']);

    return Responsemsg().successRes(msg: "login");
  }catch(error){
    print(error);
    
return Responsemsg().errorRes(msg: "error");
  }
}