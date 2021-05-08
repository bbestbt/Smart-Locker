import 'dart:convert';

OTPModel otpModelFromJson(String str) => OTPModel.fromJson(json.decode(str));

String otpModelToJson(OTPModel data) => json.encode(data.toJson());

class OTPModel {
  OTPModel({this.code});

  String code;

  factory OTPModel.fromJson(Map<String, dynamic> json) => OTPModel(
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
