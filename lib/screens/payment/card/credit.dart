import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/payment/card/creditCard.dart';

class CreditScreen extends StatefulWidget {
  static String routeName = "/credit";
  final price;

  CreditScreen(this.price);

  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
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
                Text(
                  "Complete your details",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                CreditCard(widget.price),
              ],
            ),
          ),
        ));
  }
}
