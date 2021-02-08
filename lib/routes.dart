
import 'package:flutter/widgets.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';
import 'package:locker/screens/splash/splash_screen.dart';

final Map<String,WidgetBuilder> routes={
  SplashScreen.routeName:(context)=> SplashScreen(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  ForgotPasswordScreen.routeName:(context)=>ForgotPasswordScreen(),
  HomeScreen.routeName:(context)=>HomeScreen(),
};
