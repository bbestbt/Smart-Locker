import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/components/no_account.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
          child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20
                        ),
                        child: Column(
        children: [
            SizedBox(height: 30),
            Text("Forgot password",
            style: TextStyle(
              fontSize: 30,
              color:Colors.black,
              fontWeight: FontWeight.bold,
              ),
            ),
            
            Text("Enter your email",textAlign: TextAlign.center,),
            SizedBox(height: 30),
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
        if (value.isNotEmpty && errors.contains("Please Enter your email")) {
          setState(() {
            errors.remove("Please Enter your email");
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains("Please Enter your email")) {
          setState(() {
            errors.add(
                "Please Enter your email");
          });
          }
          else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")).hasMatch(value) &&
              !errors.contains("Please Enter Valid Email")){
                setState(() {
                  errors.add("Please Enter Valid Email");
                });
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        labelText: "email",
        hintText: "enter an email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
        ),
          ),
          SizedBox(height:20),
          FormError(errors:errors),
          SizedBox(height:30),
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
