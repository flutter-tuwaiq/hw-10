import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomVerifyResponse.dart';
import '../../Services/Supabase/supabaseEnv.dart';

verificationEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    await SupabaseEnv().supabase.auth.verifyOTP(
        token: body['otp'], type: OtpType.signup, email: body['email'],);
        
    return CustomVerifyResponse().successResponse(msg: "email is confirmed");
  } catch (error) {
    return CustomVerifyResponse().errorResponse(msg: "email is not confirmed");
  }
}