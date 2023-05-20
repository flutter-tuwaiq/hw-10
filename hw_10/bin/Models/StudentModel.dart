class StudentModel {
  late final int? id;
  final String? name;
  final String email;
  final String username;
  final String? idAuth;

  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.idAuth,
  });

  factory StudentModel.fromJson({required Map json}) {
    return StudentModel(
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
      "username": username,
      "id_auth": idAuth,
    };

    if (id == null || name == null) {
      return jsonMap;
    }

    return {"id": id, "name": name, ...jsonMap};
  }
}
