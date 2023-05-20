import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/suba/supabaseEnv.dart';

verificatioEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await SupaBaseEnv().supabase.auth.verifyOTP(
          token: body['otp'],
          type: OtpType.signup,
          email: body['email'],
        );

    return CustomResponse().successSignupResponse(msg: "email is confirmed");
  } catch (error) {
    print(error);

    return CustomResponse().errorSignupResponse(
      msg: "email not confirmed",
    );
  }
}
