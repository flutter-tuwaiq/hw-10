
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';
import '../Models/StudentModel.dart';
import '../Service/SupaBaseEnv.dart';

createResponse(Request request) async {


        try {

          final  body = json.decode(await request.readAsString());

          final supaBaseVaribal = SupaBaseEnv().supaBase.auth;

          UserResponse studentInfo = await supaBaseVaribal.admin.createUser(
              AdminUserAttributes(
                email: body["email"],
                password:body["password"],
                ),);

              StudentModel studentObject = 
              StudentModel(username: body["username"] , name: body["name"] ,email: body["email"] , id_auth : studentInfo.user!.id);  

              await supaBaseVaribal.signInWithOtp(email: body["email"]);

              var supaBase = SupaBaseEnv();
              await supaBase.supaBase
                  .from("Student")
                  .insert(studentObject.toMap());
              
                 var listOfuserInfo = await SupaBaseEnv().supaBase
                          .from('Student')
                          .select("id , name , id_auth").eq("username", body["username"]);
                    
              return Response.ok(jsonEncode(listOfuserInfo),
                        headers: {'Content-Type': 'Application/json',
                        },);

    } catch (e) {
      print(e);
    }
}
