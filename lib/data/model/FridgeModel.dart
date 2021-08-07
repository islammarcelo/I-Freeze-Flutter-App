class FridgeModel {
  String fridgeName;
  String time;
  String doorStatus;
  String humidity;
  String status;
  String temperature;
  Map<dynamic, dynamic> humidityHistory;
  Map<dynamic, dynamic> temperatureHistory;
  Map<dynamic, dynamic> doorHistory;

  FridgeModel(this.fridgeName);

  toMap() => {
        "fridgeName": fridgeName,
        "time": "2021-05-25 04:17:00",
        "humidityHistory": {},
        "temperatureHistory": {},
        "doorHistory": {},
        "doorStatus": doorStatus,
        "humidity": humidity,
        "status": "Disconnected",
        "temperature": temperature,
      };

  FridgeModel.fromMap(Map<dynamic, dynamic> map)
      : fridgeName = map["fridgeName"],
        time = map["time"],
        humidityHistory = map["humidityHistory"],
        doorHistory = map["doorHistory"],
        temperatureHistory = map["temperatureHistory"],
        status = map["status"],
        temperature = map["temperature"],
        humidity = map["humidity"],
        doorStatus = map["doorStatus"];
}
