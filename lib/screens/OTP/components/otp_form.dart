
import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/size_config.dart';


class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2;
  FocusNode pin3;
  FocusNode pin4;
  @override
  void initState() {
    super.initState();
    pin2=FocusNode();
    pin3=FocusNode();
    pin4=FocusNode();
  }

  @override
  void dispose() {
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  void nextBox({String value,FocusNode focusNode}) {
    if(value.length==1){
      focusNode.requestFocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                autofocus: true,
                obscureText:true ,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
              textAlign: TextAlign.center,
              onChanged: (value){
                nextBox(value:value,focusNode:pin2);
              },
             
              ),
              ),

              SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin2,
                obscureText:true ,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
              textAlign: TextAlign.center,
              onChanged: (value){
                nextBox(value:value,focusNode:pin3);
              },
             
              ),
              ),

              SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin3,
                obscureText:true ,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
              textAlign: TextAlign.center,
              onChanged: (value){
                nextBox(value:value,focusNode:pin4);
              },
             
              ),
              ),

              SizedBox(width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin4,
                obscureText:true ,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24),
              decoration: otpInputDecoration,
              textAlign: TextAlign.center,
              onChanged: (value){
                pin4.unfocus();
              },
             
              ),
              ),

              

            ],
            ),
            SizedBox(height: SizeConfig.screenHeight*0.15,),
            DefaultButton(text:"Continue",press:(){}),
            
        ],
      ),
      
    );
  }
}