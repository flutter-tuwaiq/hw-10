class model {
  late final int? id;
  final String username;
  //final String password;
  final String email;
  final String name;
  final String idAuth;


  model(
      {this.id, 
      required this.username,
      //required this.password,
      required this.email,
      required this.name ,
      required this.idAuth});

  factory model.fromJson({required Map json}) {
    return model(
      id: json["id"],
      username: json["username"],
      //password: json["password"],
      email: json["email"],
      name: json["name"],
      idAuth: json["id_auth"]
    );
  }

  Tomap() {
    final jsonMap = {
      "username": username ,
      //"password": password,
      "email": email,
      "name": name,
      "id_auth": idAuth,
    };
   // if (id == null) {
      return jsonMap;
   // }
  }
}
