import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ui/screens/HomePage.dart';
import 'package:ifreezeapp/data/repository/UserRepository.dart';
import 'ui/screens/LoginPage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserRepository userRepository = new UserRepository();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }

}
