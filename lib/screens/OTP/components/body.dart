import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/components/otp_form.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = '';

  Future resendCode() async {
    getEmail();
    var response = await http.get(
      Uri.https(
          'smart-locker-api.azurewebsites.net', 'api/Account/resend-code'),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "email": email,
      },
    );
   // print(email);
    if (response.statusCode == 200) {
      print('already send new code');
    } else
      return null;
  }

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to your email"),
              buildTimer(),
              SizedBox(height: 120),
              OtpForm(),
              SizedBox(height: 80),
              GestureDetector(
                  onTap: () {
                    //resend
                    resendCode();
                  },
                  child: Text(
                    "Resend OTP code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("The code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Color(0xFF6F35A5)),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
