import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName="/payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
           
              Text(
                "Payment",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
              SizedBox(height: 50),
               ],
          ),
        ),
      ),
           
      
    );
  }
}