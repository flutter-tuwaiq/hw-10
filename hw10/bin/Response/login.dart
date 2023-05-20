import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../Msg/CustomResponse.dart';
import '../seriver.dart/SupabaseEnv.dart';

login(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    await SupabaseEnv()
    .supabase
    .auth.signInWithPassword(email:body['email'],password: body['password']);
    return CustomResponse().successResponse(msg: "login");
  }catch(error){
    print(error);

return CustomResponse().errorResponse(msg: "error");
  }
}