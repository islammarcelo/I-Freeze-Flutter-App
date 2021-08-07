
class User{
  String username;
  int password;
  String id;

  User(this.username, this.password, this.id);

  User.fromMap(Map<String, dynamic> map,String id) :
      username = map["username"],
      password = map["password"],
      id = id;

}