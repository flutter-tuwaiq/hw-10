class UserModel {
  final int? id;
  final String? fristName;
  final String? lastName;
  final String email;
  final String idAuth;

  UserModel(
      {this.id,
      this.fristName,
      this.lastName,
      required this.email,
      required this.idAuth});

  factory UserModel.fromJason({required Map json}) {
    return UserModel(
      id: json['id'],
      fristName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      idAuth: json['id_Auth'],
    );
  }
  toMap() {
    final jsonMap = {
      "first_name": fristName ?? "guest",
      "last_name": lastName,
      "email": email,
      "id_Auth": idAuth,
    };
    if (id == null) {
      return jsonMap;
    }

    return {"id": id, ...jsonMap};
  }
}
