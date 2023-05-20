import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/suba/supabaseEnv.dart';

loginResponse(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    final supabaseVar = SupaBaseEnv().supabase;
    final List signinStudent = await supabaseVar
        .from("Student")
        .select("id, name , email")
        .eq("username", body["username"]);

    if (signinStudent.isEmpty) {
      return CustomResponse()
          .errorloginResponse(msg: "Sorry, You need to Sign up first");
    }

    await supabaseVar.auth.signInWithPassword(
      email: signinStudent[0]["email"],
      password: body["password"],
    );

    final token = supabaseVar.auth.currentSession!.accessToken;

    return CustomResponse().successloginResponse(
      msg: "login successfully ..\n",
      data: [
        {token},
      ],
    );
  } catch (error) {
    CustomResponse().errorloginResponse(msg: "Error in login");
  }
}
