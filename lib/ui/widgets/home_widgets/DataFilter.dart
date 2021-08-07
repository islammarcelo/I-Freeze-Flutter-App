import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataFilter{
  final List<DocumentSnapshot> documents;

  const DataFilter({this.documents});

  List<DocumentSnapshot> filter (String status) {

    List<DocumentSnapshot> newList = new List();

    if (status != "All") {
      for (var doc in documents) {
        //print(doc.id);
        if (doc.get("status") == status)
          newList.add(doc);
      }
      return newList;
    }
    else {
      return documents;
    }
  }

  void checkFridgeConnection(){
    
    for(var doc in documents){
      DateTime fridgeDate = DateTime.parse(doc.get("time"));
      DateTime curr = DateTime.parse(DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()));
      var dateDifference = curr.difference(fridgeDate).inSeconds;

      if(dateDifference >= 15*60 && doc.get("status") == "Connected"){//time not username
        //update data
        _update(doc,"Disconnected");

      }
      else if (dateDifference <= 15*60 && doc.get("status") == "Disconnected"){//time not username
        _update(doc,"Connected");
      }
    }

  }

  void _update(DocumentSnapshot doc, String status) {

    Firestore.instance
        .collection('users/vl5dCOo5wTUAjiitROO3/fridges')
        .document(doc.id)
        .updateData({
      "status":status
    }).then((result){
      print("updated");
    }).catchError((onError){
      print("onError");
    });
  }


}