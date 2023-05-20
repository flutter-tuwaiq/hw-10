// ignore_for_file: file_names

import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../Env/SupaBaseEnv.dart';
import 'ResponseMsg/responseMsg.dart';

loginResponse(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supaBaseVar = SupaBAseEnv().supaBase;

    final List login = await supaBaseVar
        .from('student')
        .select('id, name , email')
        .eq('username', body['username']);

    if (login.isEmpty) {
      return ResponseMsg().errorResponse(
        message: 'This username does not exist, signup first and try again....',
      );
    }

    await supaBaseVar.auth.signInWithPassword(
      email: login[0]['email'],
      password: body['password'],
    );

    final token = supaBaseVar.auth.currentSession!.accessToken;

    final Map data = login[0];
    data['token'] = token;

    return ResponseMsg().successResponse(message: 'Login successfull!');
  } catch (e) {
    print(e);

    return ResponseMsg().errorResponse(message: 'There is something wrong....');
  }
}
