import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../Models/StudentModel.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/suba/supabaseEnv.dart';

signUpResponse(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    if (body.keys.toString() != "(username, password, email, name)") {
      return CustomResponse().errorSignupResponse(msg: "");
    }
    final supabaseVar = SupaBaseEnv().supabase;

    UserResponse userInfo = await supabaseVar.auth.admin.createUser(
      AdminUserAttributes(
        email: body['email'],
        password: body['password'],
      ),
    );

    StudentModel studentOpject = StudentModel(
      email: userInfo.user!.email!,
      idAuth: userInfo.user!.id,
      username: body["username"],
      name: body["name"],
    );

    // send verification Otp to email
    await supabaseVar.auth.signInWithOtp(email: body["email"]);

    await supabaseVar.from("student").insert(studentOpject.toMap());

    /* If SignUp went successfuly Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                      */
    return CustomResponse().successSignupResponse(
      msg: "Account created successfuly",
      data: [body],
    );
  } catch (error) {
    print(error);

/* If SignUp went Wrong Show this Custome Response ----
        <---<-----<------<----------<-------<-----<-----<---<
       |
       |
       V                                                    */
    return CustomResponse().errorSignupResponse(
      msg: "Sorry : Somthing wrong in your Registration",
    );
  }
}
