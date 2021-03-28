import 'package:flutter/material.dart';
import 'package:locker/screens/booked_detail/booked_form.dart';
import 'package:locker/screens/sign_in/components/sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Locker",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
             BookedForm(),
            ],
          ),
        ),
      ),
    );
  }
}
