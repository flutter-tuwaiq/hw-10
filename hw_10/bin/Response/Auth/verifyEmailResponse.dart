import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../../ResponseMsg/CustomResponse.dart';
import '../../Services/Supabase/SupabaseEnv.dart';

verifyEmailResponse(Request request)async{

  try{

    // Create a body variable and convert it to json

    final body = json.decode(await request.readAsString());

    
    // verify emaile for otp code 

    await SupabaseEnv().supabase.auth.verifyOTP(token: body["otp"], type: OtpType.signup ,email : body["email"]);

    // caoll the successResponse massage methode to disbly succsses massage

    return CustomResponse().successResponse(msg: "email is confirm");

  }catch(error){
    print(error);

    // caoll the errorResponse massage methode to disbly error massage

    return CustomResponse().errorResponse(msg: "email is not confirm");
  }

}