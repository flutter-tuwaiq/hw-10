import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../modles/student_model.dart';
import '../msg/response_msg.dart';
import '../services/supabase_env.dart';



signup(Request req) async {
  try{
    final body = json.decode(await req.readAsString());
    final supavaribale =SupabaseEnv().supabase;
    var studentinfo=  await supavaribale.auth.admin.createUser(AdminUserAttributes(email: body['email'], password: body['password']),);
    StudentModel studentOpject = StudentModel(username: body['username'],email: studentinfo.user!.email!,name: body['name'],idath: studentinfo.user!.id);
    await supavaribale.auth.signInWithOtp(email: body['email']);
    await supavaribale.from('student').insert(studentOpject.toMap());

    return Responsemsg().successResponse(msg: "created");
  }catch(error){
    print(error);
    
return Responsemsg().errorResponse(msg: "error here");
  }
}