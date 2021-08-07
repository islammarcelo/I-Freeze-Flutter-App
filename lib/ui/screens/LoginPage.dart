import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'HomePage.dart';
import '../../LoginValidation.dart';

import '../../Animation.dart';

class LoginPage extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<LoginPage> {
  bool _showPassword = false;
  String username, password;
  TextEditingController _textFieldControllerUsername = TextEditingController();
  TextEditingController _textFieldControllerPassword = TextEditingController();
  bool _usernameTextFailedValidate = false;
  bool _passwordTextFailedValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: FadeAnimation(
                                1,
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/freezing.png'))),
                                )),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: FadeAnimation(
                                1.8,
                                Container(
                                  //margin: EdgeInsets.only(top: 100),
                                  child: Text(
                                    "I-Freeze",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(80)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: FadeAnimation(
                                2,
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 80,
                            child: FadeAnimation(
                                2.2,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
                                    //alignment: Alignment.center,
                                    child: TextField(
                                      controller: _textFieldControllerUsername,
                                      onChanged: (value) {
                                        setState(() {
                                          username = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2.0),
                                          ),
                                          labelText: "Username",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                          hintText: 'username',
                                          prefixIcon:
                                              Icon(Icons.account_circle)),
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 80,
                            child: FadeAnimation(
                                2.2,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                143, 148, 251, .2),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: TextField(
                                      controller: _textFieldControllerPassword,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      obscureText: !this._showPassword,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue, width: 2.0),
                                        ),
                                        labelText: "Password",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        hintText: 'Enter your password',
                                        prefixIcon: Icon(Icons.security),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: this._showPassword
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() => this._showPassword =
                                                !this._showPassword);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            height: 60,
                            child: FadeAnimation(
                                2.2,
                                Container(
                                  width: 300,
                                  padding: EdgeInsets.all(5),
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.black,
                                    child: Text("LOGIN"),
                                    onPressed: () {
                                      setState(() {
                                        _usernameTextFailedValidate =
                                            (_textFieldControllerUsername
                                                    .text.isNotEmpty)
                                                ? true
                                                : false;
                                        _passwordTextFailedValidate =
                                            (_textFieldControllerPassword
                                                    .text.isNotEmpty)
                                                ? true
                                                : false;
                                      });

                                      if (_passwordTextFailedValidate &&
                                          _usernameTextFailedValidate) {
                                        print(username + " " + password);

                                        if (LoginValidation(username, password)
                                            .validateUserNameAndPassword()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                        } else {
                                          releaseToast(
                                              "Incorrect username or password.");
                                        }
                                      } else {
                                        releaseToast(
                                            "Please, Enter username and password.");
                                      }
                                    },
                                    shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(10.0),
                                  ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }

  void releaseToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 13.0);
  }
}
