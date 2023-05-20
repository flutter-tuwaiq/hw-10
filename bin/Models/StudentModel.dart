
import 'dart:convert';

class StudentModel {
    final int? id;
    final String? username;
    final String? email;
    final String? name;
    final String? id_auth;

    StudentModel(
      {
      this.id,
      this.username,
      this.email,
      this.name,
      this.id_auth,
      });



    factory StudentModel.fromJson({required Map json}){
       return StudentModel(
        id: json["id"],
        username : json["username"],
        email: json["email"],
        name: json["name"],
        id_auth: json["id_auth"],
       );
    }

    toMap(){
      final jsonMap = {
        "username" : username,
        "email": email,
        "name": name,
        "id_auth": id_auth,

      };

      if (id == null)
      {
        return jsonMap;
      }

    return {"id":id ,... jsonMap};

    }







}