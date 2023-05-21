class Student {
  String? username;
  String? email;
  String? name;
  int? id;
  String? idAuth;

  Student({this.username, this.email, this.id, this.idAuth, this.name});

  Student.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['id'];
    idAuth = json['id_auth'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['id'] = this.id;
    data['id_auth'] = this.idAuth;
    data['name'] = this.name;

    return data;
  }
}
