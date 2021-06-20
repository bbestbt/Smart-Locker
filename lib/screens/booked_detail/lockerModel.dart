import 'dart:convert';
//convert to model
lockerModel lockerModelFromJson(String str) => lockerModel.fromJson(json.decode(str));
//convert to json as string
String lockerModelToJson(lockerModel data) => json.encode(data.toJson());

class lockerModel {
  lockerModel({this.lockerId,this.date,this.time});

  int lockerId;
  String date;
  String time;

  factory lockerModel.fromJson(Map<String, dynamic> json) => lockerModel(
        lockerId: json["lockerId"],
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "lockerId": lockerId,
        "date":date,
        "time":time,
      };
}
