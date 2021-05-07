import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:locker/constants.dart';
import 'package:locker/routes.dart';
import 'package:locker/screens/app/app_screen.dart';
import 'package:locker/screens/payment/card/credit.dart';
import 'package:locker/screens/payment/card/creditCard.dart';
import 'package:locker/screens/payment/scan/scan.dart';

import 'package:locker/theme.dart';
import 'package:http/http.dart' as http;

void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
    // home: CreditScreen(),
      initialRoute: AppScreen.routeName,
      routes: routes,
    );
  }
}
