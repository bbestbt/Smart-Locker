import 'package:flutter/material.dart';
import 'package:locker/screens/OTP/components/body.dart';


class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("OTP Verification"),
      ),
      body: Body(),
    );
  }
}
