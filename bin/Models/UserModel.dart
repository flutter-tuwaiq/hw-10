class UserModel {
  late final int? id;
  final String name;
  final String email;
  final String username;
  final String idAuth;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.idAuth,});

  factory UserModel.fromJson({required Map json}) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      username: json["username"],
      idAuth: json["id_auth"],
    );
  }

  toMap() {
    final jsonMap = {
      "email": email,
      "name": name,
      "username": username,
      "id_auth": idAuth,
    };

    if (id == null){
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}
