import 'package:flutter/material.dart';
import 'package:locker/components/custom_suffix_icon.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/components/no_account.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
          child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)
                        ),
                        child: Column(
        children: [
            SizedBox(height: SizeConfig.screenHeight*0.04),
            Text("Forgot password",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              color:Colors.black,
              fontWeight: FontWeight.bold,
              ),
            ),
            
            Text("Enter your email",textAlign: TextAlign.center,),
            SizedBox(height: SizeConfig.screenHeight*0.04),
            ForgotPasswordForm(),
        ],

        
      ),
                      ),
          ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey=GlobalKey<FormState>();
  List<String> errors=[];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey ,
      child: Column(
      children:[
          TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(
                // "please enter username"
                kEmailNullError);
          });
          }
          else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)){
                setState(() {
                  errors.add(kInvalidEmailError);
                });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "email",
        hintText: "enter an email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
        ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors:errors),
          SizedBox(height: SizeConfig.screenHeight*0.04),
          DefaultButton(text:"Continue",press:(){
            if(_formKey.currentState.validate()){
              //add code
            }
          }),
          // NoAccount(),
      
      
      ],
      ),
      
    );
  }
}
