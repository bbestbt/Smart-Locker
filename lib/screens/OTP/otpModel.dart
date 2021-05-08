import 'dart:convert';
OTPModel otpModelFromJson(String str) => OTPModel.fromJson(json.decode(str));

String otpModelToJson(OTPModel data) => json.encode(data.toJson());

class OTPModel{
  OTPModel({ this.email, this.code});

  String email;
  String code;

  factory OTPModel.fromJson(Map<String,dynamic> json)=> OTPModel(
    email:json["email"],
    code:json["code"],


  );

  Map<String,dynamic> toJson()=>{
    "email":email,
    "code":code,


  };
}