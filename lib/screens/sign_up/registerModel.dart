import 'dart:convert';
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel{
  DataModel({ this.userName, this.password, this.phoneNumber, this.email, this.confirmPassword});

  String userName;
  String password;
  String phoneNumber;
  String email;
  String confirmPassword;

  factory DataModel.fromJson(Map<String,dynamic> json)=> DataModel(
    userName:json["userName"],
    password:json["password"],
    phoneNumber:json["phoneNumber"],
    email:json["email"],
    confirmPassword:json["confirmPassword"],
  );

  Map<String,dynamic> toJson()=>{
    "userName":userName,
    "password":password,
    "phoneNumber":phoneNumber,
    "email":email,
    "confirmPassword":confirmPassword,
  };
}