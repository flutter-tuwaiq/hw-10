class StudentModel{
final int? id;
final String username;
final String email;
final String name;
final String idath;
StudentModel({this.id,required this.username,required this.email,required this.name,required this.idath});

factory StudentModel.fromjson({required Map json}){
return StudentModel(
  id: json['id'],
  username: json['username'],
  email: json['email'],
  name: json['name'],
  idath: json['id_auth'],
);
}
toMap(){
  final jsonMap={
    'username': username,
    'email': email,
    'name':name,
    'id_auth':idath,
  };
  if(id == null){
    return jsonMap;
  }

  return {'id':id,...jsonMap};
}
}