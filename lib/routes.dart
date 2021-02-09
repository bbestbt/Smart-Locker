
import 'package:flutter/widgets.dart';
import 'package:locker/screens/OTP/otp_screen.dart';
import 'package:locker/screens/app/app_screen.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';
import 'package:locker/screens/sign_up/sign_up_screen.dart';


final Map<String,WidgetBuilder> routes={
  AppScreen.routeName:(context)=> AppScreen(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  ForgotPasswordScreen.routeName:(context)=>ForgotPasswordScreen(),
  HomeScreen.routeName:(context)=>HomeScreen(),
  SignUpScreen.routeName:(context)=>SignUpScreen(),
  OtpScreen.routeName:(context)=>OtpScreen(),
};
