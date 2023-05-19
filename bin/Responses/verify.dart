import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Supabase/supabase.dart';

verify(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVar = Supabase().supabase;

    //Verify account
    await supabaseVar.auth.verifyOTP(
      token: body['otp'],
      type: OtpType.signup,
      email: body['email'],
    );

    return Response.ok("Your Email has been confirmed");
  } catch (error) {
    print(error);

    return Response.badRequest(body: "Your Email has not  been comfired");
  }
}
