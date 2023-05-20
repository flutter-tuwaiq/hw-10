// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../Env/SupaBaseEnv.dart';
import 'ResponseMsg/responseMsg.dart';

loginResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supaBaseVar = SupaBAseEnv().supaBase;

    final List login = await supaBaseVar
        .from('student')
        .select('id, name , email')
        .eq('username', body['username']);  //(string, required): The username of the user.

    if (login.isEmpty) {
      return ResponseMsg().errorResponse(
        message: 'This username does not exist, signup first and try again....',
      );
    }

    await supaBaseVar.auth.signInWithPassword(
      email: login[0]['email'],
      password: body['password'],  //(string, required): The password of the user.
    );

    return ResponseMsg().successResponse(message: 'Login successfull!');  //A JSON object containing the user's information, such as user ID, name, and token.
  } catch (e) {
    print(e);

    return ResponseMsg().errorResponse(message: 'There is something wrong....');  //A JSON object with an error message indicating invalid credentials or authentication failure.
  }
}
