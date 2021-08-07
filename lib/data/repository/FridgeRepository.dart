import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ifreezeapp/data/model/FridgeModel.dart';

class FridgeRepository {
  var database = FirebaseFirestore.instance
      .collection("users")
      .doc("vl5dCOo5wTUAjiitROO3")
      .collection("fridges");

  addFridge(String fridgeName) {
    FridgeModel fridge = new FridgeModel(fridgeName);
    database.add(fridge.toMap());
  }

  List<FridgeModel> getFridges(List<DocumentSnapshot> documents) {
    var fridges =
        documents.map((fridge) => FridgeModel.fromMap(fridge.data())).toList();
    return fridges;
  }
}
