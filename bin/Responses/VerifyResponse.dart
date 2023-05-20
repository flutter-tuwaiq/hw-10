
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../Service/SupaBaseEnv.dart';

verifyResponse(Request request) async{

   final body = jsonDecode(await request.readAsString());

      await SupaBaseEnv().supaBase.auth.verifyOTP(
          token: body["otp"],
          type: OtpType.signup,
          email: body["email"],
        );

        return Response.ok( "Confirm");


}



 