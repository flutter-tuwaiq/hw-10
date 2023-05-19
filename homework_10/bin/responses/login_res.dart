import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/success_res.dart';
import '../services/supabase/supabase_env.dart';

Future<Response> loginHandler(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    // check if the user has entered valid values.
    if (body.keys.toString() != "(username, password)") {
      return BadReqRes().errorResponse(msg: "Invalid input!");
    }

    final supabase = SupabaseEnv().supabase;

    // check if the username and password is correct and store the email and the id if it is.
    List checkUser = await supabase
        .from("students")
        .select("email,id_auth,name")
        .eq("username", body["username"])
        .eq("password", body["password"]);

    if (checkUser.isEmpty) {
      return BadReqRes().errorResponse(msg: "You don't have an account!");
    }
    // storing the email and id in a variables.
    final userEmail = checkUser[0]["email"];
    final idAuth = checkUser[0]["id_auth"];
    final name = checkUser[0]["name"];

    // login the user.
    await supabase.auth.signInWithPassword(
      email: userEmail,
      password: body["password"],
    );

    return SuccessRes().okResponse(
      msg: "You are now logged in.",
      data: [
        {
          "name": name,
          "user ID": idAuth,
        },
      ],
    );
  } catch (e) {
    print(e);

    return BadReqRes().errorResponse(
      msg: "Something went wrong! try verifying your account.",
    );
  }
}
