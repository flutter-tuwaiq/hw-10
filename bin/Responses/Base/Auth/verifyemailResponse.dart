// ignore_for_file: file_names

import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../../ResponseMsg/CustomResponse.dart';
import '../../../Services/SupaBase/supabaseEnv.dart';

verificationEmail(Request req) async {
  try {
    final body = json.decode(await req.readAsString());

    await SupabaseEnv().supabase.auth.verifyOTP(
          token: body["otp"],
          type: OtpType.signup,
          email: body["email"],
        );

    return CustomResponse().successResponse(msg: "confirm", statusCode: 200);
  } on AuthException catch (error) {
    return CustomResponse()
        .errorResponse(msg: error.message, statusCode: error.statusCode);
  } on Exception catch (error) {
    return CustomResponse().errorResponse(msg: '$error', statusCode: '400');
  }
}
