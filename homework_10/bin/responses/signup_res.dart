import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/created_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> signupHandler(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    // check if the user has entered valid values.
    if (body.keys.toString() != "(username, password, email, name)") {
      return BadReqRes().errorResponse(msg: "Invalid input!");
    }

    final supabase = SupabaseEnv().supabase;
    final selectFromStudents = supabase.from("students").select();

    // check if the user already have an account by the email.
    List checkEmail = await selectFromStudents.eq("email", body["email"]);

    if (checkEmail.isNotEmpty) {
      return BadReqRes().errorResponse(msg: "You already have an account!");
    }

    // check if the username is taken.
    List checkUsername =
        await selectFromStudents.eq("username", body["username"]);

    if (checkUsername.isNotEmpty) {
      return BadReqRes().errorResponse(msg: "Username already taken!");
    }

    // create the user.
    UserResponse userInfo = await supabase.auth.admin.createUser(
      AdminUserAttributes(email: body["email"], password: body["password"]),
    );

    // add the user to the students table.
    final idAuth = userInfo.user?.id;
    await await supabase.from("students").insert({
      "username": body["username"],
      "password": body["password"],
      "email": body["email"],
      "name": body["name"],
      "id_auth": idAuth,
    });

    // send verification email.
    await supabase.auth.signInWithOtp(
      email: body["email"],
    );

    return CreatedRes().createdResponse(
      msg:
          "Account created! you will receive an email to confirm your account.",
      data: [
        {
          "name": body["name"],
          "user ID": idAuth,
        },
      ],
    );
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(msg: "Something went wrong!");
  }
}
