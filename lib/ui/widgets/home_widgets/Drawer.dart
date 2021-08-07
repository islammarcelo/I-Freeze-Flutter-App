import 'package:flutter/material.dart';
import 'package:ifreezeapp/ui/screens/HomePage.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            child: Container(
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.black)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('images/home.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: new Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('images/history.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute()
                          //builder: (context) => HistoryPage(),
                          );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: new Text(
                        "History",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('images/settings.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute()
                          //builder: (context) => HistoryPage(),
                          );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: new Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('images/logout.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute()
                          //builder: (context) => HistoryPage(),
                          );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: new Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
