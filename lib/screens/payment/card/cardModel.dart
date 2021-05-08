import 'dart:convert';
CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel{
  CardModel({this.name, this.cardNumber, this.month, this.year, this.cvc});

  String name;
  String cardNumber;
  int month;
  int year;
  String cvc;

  factory CardModel.fromJson(Map<String,dynamic> json)=> CardModel(
    name: json["name"],
    cardNumber:json["cardNumber"],
    month:json["month"],
    year:json["year"],
    cvc:json["cvc"],

  );

  Map<String,dynamic> toJson()=>{
    "name":name,
    "cardNumber":cardNumber,
    "month":month,
    "year":year,
    "cvc":cvc,

  };
}