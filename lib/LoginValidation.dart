import 'package:cloud_firestore/cloud_firestore.dart';

class LoginValidation {
  String username;
  String password;

  LoginValidation(this.username, this.password);

  bool validateUserNameAndPassword() {
    var validate = false;
    String u = "islam";
    String p = "12345";
    if (u == username &&
        p == password) {
      validate = true;
      //return value.id;
    }

    return validate;
  }

}
