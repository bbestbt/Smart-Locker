import 'package:flutter/material.dart';
import 'package:locker/screens/app/components/body.dart';




class AppScreen extends StatelessWidget {
  static final routeName='/app';
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
  //  SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}