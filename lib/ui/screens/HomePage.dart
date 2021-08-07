import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifreezeapp/data/repository/FridgeRepository.dart';
import 'package:ifreezeapp/ui/widgets/home_widgets/DataFilter.dart';
import 'package:ifreezeapp/ui/widgets/home_widgets/Drawer.dart';
import 'package:ifreezeapp/ui/widgets/home_widgets/FirestoreListView.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<HomePage> {
  String dateNow = DateFormat("yMMMMEEEEd").format(DateTime.now());
  String valueChoose = "All";
  List listItem = ["All", "Connected", "Disconnected"];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _textFieldController = TextEditingController();
  String codeDialog;
  String valueText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset('images/menu.png'),
                          onPressed: () =>
                              _scaffoldKey.currentState.openDrawer(),
                        ),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage('images/notification.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              icon: Image.asset('images/add.png'),
                              onPressed: () => _displayTextInputDialog(context),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(
                            'images/freezing.png',
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "I-Freeze",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$dateNow",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 8, bottom: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: DropdownButton(
                                hint: Text('Select Status'),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                },
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users/vl5dCOo5wTUAjiitROO3/fridges').snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.all(5),
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: AlwaysStoppedAnimation(Colors.grey),
                              ),
                            ),
                          );
                        DataFilter(documents: snapshot.data.docs)
                            .checkFridgeConnection();
                        return FireStoreListView(
                            documents: DataFilter(documents: snapshot.data.docs)
                                .filter(valueChoose));
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text('Create Fridge'),
            content: TextField(
              controller: _textFieldController,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              decoration: InputDecoration(hintText: "Enter Fridge Name"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  _textFieldController.clear();
                  setState(() {
                    if (valueText != null) {
                      FridgeRepository().addFridge(valueText);
                      Navigator.pop(context);
                      _textFieldController.clear();
                      releaseToast("Created New Fridge Successful.");
                    } else if (valueText == null) {
                      releaseToast("Please, Enter Fridge Name.");
                    }
                  });
                },
              ),
            ],
          );
        });
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
