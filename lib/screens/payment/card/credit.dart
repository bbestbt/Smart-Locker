import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/payment/card/creditCard.dart';


class CreditScreen extends StatelessWidget {
  static String routeName="/credit";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
              child: Column(
          children: [
            Text("Fill your credit card", style: headingStyle),
            Text("Complete your details",textAlign: TextAlign.center,),
            SizedBox(height:50),
            CreditCard(),
          ],
        ),
      ),
    )
      
    );
  }
  }