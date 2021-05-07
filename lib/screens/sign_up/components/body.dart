import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/sign_up/components/sign_up_form.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
              child: Column(
          children: [
            Text("Register account", style: headingStyle),
            Text("Complete your details",textAlign: TextAlign.center,),
            SizedBox(height:50),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
