import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../Supabase/supabase.dart';

login(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVar = Supabase().supabase;

    //Login account
    await supabaseVar.auth.signInWithPassword(
      email: body['email'],
      password: body['password'],
    );

    //If the user signed up successfully their data will be shown
    return Response.ok(
      json.encode(
        {'ID': '', 'Name': body['name'], 'Token': ''},
      ),
      headers: {'content-type': 'application/json'},
    );
  } catch (error) {
    print(error);

    //If the user faced a problem the type of error will be shown
    return Response.badRequest(
      body: json.encode({'Error': "$error"}),
      headers: {'content-type': 'application/json'},
    );
  }
}
