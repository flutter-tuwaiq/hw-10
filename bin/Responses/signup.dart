import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../Supabase/supabase.dart';

signup(Request req) async {
  try {
    final body = json.decode(await req.readAsString());
    final supabaseVar = Supabase().supabase;

    UserResponse userInfo = await supabaseVar.auth.admin.createUser(
      AdminUserAttributes(email: body['email'], password: body['password']),
    );

    final userid = userInfo.user?.id;

    //Add user's data to ta server
    await supabaseVar.from('hw10').insert({
      'username': body['username'],
      'email': body['email'],
      'name': body['name'],
      'id_auth': userid,
    });

    //If the user signed up successfully their data will be shown
    return Response.ok(
      json.encode(
        {'ID': userid, 'Name': body['name'], 'Token': ''},
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
