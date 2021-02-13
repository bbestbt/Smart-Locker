import 'package:flutter/material.dart';
import 'package:locker/screens/booked/components/body.dart';


class BookedScreen extends StatelessWidget {
  static String routeName="/booked";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Body(),
      
    );
    
  }
}