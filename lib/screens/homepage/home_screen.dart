import 'package:flutter/material.dart';
import 'package:locker/screens/homepage/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName="/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text("Home")
      // ), 
      body: Body(),
      
      
    );
  }
}