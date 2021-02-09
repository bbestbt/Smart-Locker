
import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/components/otp_form.dart';
import 'package:locker/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
                          child: Column(
        children: [
              SizedBox(height:SizeConfig.screenHeight*0.05), //10%
              Text("OTP Verification",style: headingStyle,),
              Text("We sent your code to 096 123 ****"),
              buildTimer(),
              SizedBox(height:SizeConfig.screenHeight*0.15), //10%
              OtpForm(),
              SizedBox(height:SizeConfig.screenHeight*0.1), //10%
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
              Text("00:${value.toInt()}",style: TextStyle(color: kPrimaryColor),
              ),
              onEnd: (){},
            )
          ],
        );
  }
}
