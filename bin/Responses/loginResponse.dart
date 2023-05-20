import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../Service/SupaBaseEnv.dart';

loginRespons(Request request) async {

    try {

      List dataOfUser =[];
        final  body = json.decode(await request.readAsString());

        final SupaBaseVaribal = await SupaBaseEnv().supaBase.auth.signInWithPassword(
                            email: body["email"],
                            password: body["password"],
                            );
        var token = SupaBaseVaribal.session!.accessToken;

        final data =  await SupaBaseEnv().supaBase
                              .from('Student')
                              .select("id , name").eq("email", body["email"]);

        var userInfo = jsonEncode(data);        
        var Token = jsonEncode(token);  
  
        dataOfUser = [userInfo,Token];      
                              
  return Response.ok("$dataOfUser" ,
            headers: {'Content-Type': 'Application/json',
            
            },);
      
    } catch (e) {
      print(e);
    }
        
}