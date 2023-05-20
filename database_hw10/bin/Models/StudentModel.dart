class StudentModel {
  final int? id;
  final String username;
  final String email;
  final String? name;
  final String idAuth;

  StudentModel({
    this.id,
    required this.username,
    required this.email,
    this.name,
    required this.idAuth,
  });

  factory StudentModel.fromJson({required Map json}) {
    return StudentModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      idAuth: json['id_auth'],
    );
  }

  // toMap() {
  //   final jsonMap = {
  //     'username': username,
  //     'email': email,
  //     'name': name,
  //     'id_auth': idAuth,
  //   };

  //   if (id == null) {
  //     return jsonMap;
  //   }

  //   return {"id": id, ...jsonMap};
  // }

  toMap() {
    return {
      'username': username,
      'email': email,
      'name': name,
      'id_auth': idAuth,
    };
  }
}
