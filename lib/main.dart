import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/routes.dart';
import 'package:locker/screens/app/app_screen.dart';
import 'package:locker/theme.dart';

void main() {
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
      // home: SplashScreen(),
      initialRoute: AppScreen.routeName,
      routes: routes,
    );
  }
}

