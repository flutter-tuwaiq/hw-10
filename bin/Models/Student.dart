// ignore_for_file: file_names

class Student {
  final int? id;
  final String? username;
  final String? email;
  final String? name;
  final String? idAuth;

  Student({
    this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.idAuth,
  });

  factory Student.fromJson({required Map json}) {
    return Student(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      name: json['name'],
      idAuth: json['id_auth'],
    );
  }

  toMap() {
    final jsonMap = {
      'username': username,
      'email': email,
      'name': name ?? 'guest',
      'id_auth': idAuth,
    };

    if (id == null) {
      return jsonMap;
    }

    return {'id': id, ...jsonMap};
  }
}
