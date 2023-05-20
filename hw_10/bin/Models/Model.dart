
class Model {
  final String? name;
  final String? username;
  final String email;
  final String idAuth;

  Model(
    {
      required this.name,
      required this.username,
      required this.email,
      required this.idAuth
    }
    
  );

  factory Model.fromjson({required Map json}){
    return Model(
      name: json["name"],
      username: json["username"],
      email: json["email"],
      idAuth: json["id_auth"],
    );    
  }

  toMap(){
    return {
        "name" : name,
        "username" : username,
        "email" :email,
        "id_auth" : idAuth,

    };

  }
}
