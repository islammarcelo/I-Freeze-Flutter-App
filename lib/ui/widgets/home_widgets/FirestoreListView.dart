import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifreezeapp/data/model/FridgeModel.dart';
import 'package:ifreezeapp/data/repository/FridgeRepository.dart';
import 'RadialGauge.dart';

class FireStoreListView extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  const FireStoreListView({this.documents});

  @override
  Widget build(BuildContext context) {
    Color statusColor = Color(0xff98FB98);
    List<FridgeModel> fridges = FridgeRepository().getFridges(documents);
    //print(fridges[0].username);

    //print(documents[0].get("username"));
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int index) {
        //String name = documents[index].get("username").toString();

        statusColor = (fridges[index].status == "Disconnected")
            ? Color(0xffFF0000)
            : Color(0xff98FB98);
        if (fridges[index].doorStatus == null &&
            fridges[index].humidity == null &&
            fridges[index].temperature == null) {
          return Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            child: Text("${fridges[index].fridgeName}")),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                              "Please, Connect the I-Freeze component to fridge..."),
                        )
                      ],
                    ),
                  )));
        } else {
          return Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            child: Card(
              color: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: statusColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${fridges[index].status}",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 17),
                                child: Row(
                                  children: [
                                    Text(
                                      "${fridges[index].fridgeName}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Temperature",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Humidity",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "StatusDoor",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${fridges[index].temperature}°C",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${fridges[index].humidity}%",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${fridges[index].doorStatus}",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 3),
                              Row(children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.refresh,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {},
                                ),
                              ])
                            ],
                          ),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RadialGauge(fridges[index].temperature),
                              Container(
                                margin: EdgeInsets.only(bottom: 3),
                                child: Row(children: [
                                  Text(
                                    "last seen: 12:00:00",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        }
      },
    );
  }
}
