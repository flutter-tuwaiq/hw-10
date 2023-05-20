// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Env/SupaBaseEnv.dart';

verifyAccountHandler(Request req) async {
  try {
    var supaBaseVar = SupaBAseEnv().supaBase;
    final body = json.decode(await req
        .readAsString()); //Validate the request body to ensure all required fields are provided

    await supaBaseVar.auth.verifyOTP(
      token: body[
          'otp'], //Verify the provided verification code against the stored code in Supabase.
      type: OtpType.signup,
      email: body['email'],
    ); //Update the account's verification status in the database upon successful verification

    return Response.ok(
      "verify account successfully",
    ); //Return an appropriate response indicating the success of the account creation process
  } catch (e) {
    print(e);

    return Response.badRequest(
      body: "Something wrong....",
    ); //Return an appropriate response indicating the failure of the account creation process
  }
}
