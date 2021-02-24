
import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/components/otp_form.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
                          child: Column(
        children: [
              SizedBox(height:40), 
              Text("OTP Verification",style: headingStyle,),
              Text("We sent your code to 096 123 ****"),
              buildTimer(),
              SizedBox(height:120), 
              OtpForm(),
              SizedBox(height:80), 
              GestureDetector(
                onTap: (){
                  //resend
                },
                child: Text("Resend OTP code",style: TextStyle(decoration: TextDecoration.underline),)),

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
            TweenAnimationBuilder(tween: Tween(begin: 30.0,end:0), duration: Duration(seconds: 30), builder: (context,value,child)=>
              Text("00:${value.toInt()}",style: TextStyle(color: Color(0xFF6F35A5)),
              ),
              onEnd: (){},
            )
          ],
        );
  }
}
