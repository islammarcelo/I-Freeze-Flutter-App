import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifreezeapp/data/model/UserModel.dart';

class UserRepository{
  List<User> myList ;

  var database = FirebaseFirestore.instance.collection("users");

  Future<List<User>> getUser() async{
    var data = await database.get();
    var users = data.docs.map((user) => User.fromMap(user.data(),user.id)).toList();
    return users;
  }

  //this function to convert Future<list<User>> to list<User>
   prepareList() async {
    var tempList = await getUser();
    myList = tempList;
    print(myList[0]);
  }



}