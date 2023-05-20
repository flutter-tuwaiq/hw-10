import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../Msg/CustomResponse.dart';
import '../class/Student.dart';
import '../seriver.dart/SupabaseEnv.dart';

Future<Response> signup(Request req) async {
  try {
        final body = json.decode(await req.readAsString());
    final supabase = SupabaseEnv().supabase;
    var studentinfo=  await supabase
    .auth
    .admin
    .createUser(AdminUserAttributes(email: body['email'], password: body['password']),);
    final student = Student(
      name: body['name'],
      username: body['username'],
      email: studentinfo.user!.email!,
      idath: studentinfo.user!.id,
    );
    await supabase.auth.signInWithOtp(email: body['email']);
    await supabase.from('student').insert(student.toMap());

    return CustomResponse().successResponse(msg: "created is true");
  }catch(error){
    print(error);

return CustomResponse().errorResponse(msg: "error ");
  }
}
