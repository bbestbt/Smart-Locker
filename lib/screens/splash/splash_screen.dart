import 'package:flutter/material.dart';
import 'package:locker/screens/splash/components/body.dart';
import 'package:locker/size_config.dart';


class SplashScreen extends StatelessWidget {
  static final routeName='/splash';
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
   SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}